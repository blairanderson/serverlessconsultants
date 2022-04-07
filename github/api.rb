require 'net/http'

module Github
  class API
    DAY = 60 * 60 * 24
    METHODS = {
      :get => Net::HTTP::Get,
      :patch => Net::HTTP::Patch
    }
    GIST_ID = ENV['GIST_ID']
    GITHUB_TOKEN = ENV['GITHUB_TOKEN']
    LOCAL_ARCHIVE = "./_data/plugins.json"
    class << self
      attr_accessor :bulk_update

      def cache
        @cache ||= {}
      end

      def bulk
        cache["in_bulk"] = true
        yield.tap do
          cache["in_bulk"] = false
          store_cache!
        end
      end

      def store_cache!
        return if cache["in_bulk"]
        return unless cache["archive"] && cache["updated"]
        # return puts "No Github token specified, cannot update archive gist" unless ENV["GITHUB_TOKEN"]

        puts "Writing to gist cache"
        # api_request(archive_uri, :method => :patch, :body => {
        #   :files => {
        #     "data.json" => {"content" => JSON.generate(cache["archive"])}
        #   }
        # })

        File.open(LOCAL_ARCHIVE,"w") do |f|
          f.write(JSON.pretty_generate(cache["archive"]))
        end

        cache["updated"] = false
      rescue => e
        puts "Error updating archived statistics"
      end

      def repo_data(repo)
        cache["repo/#{repo}"] ||= (repo_from_archive(repo) || repo_from_api(repo) || {})
      end

      def repo_data_for(repo, day)
        fetch_archive unless cache["archive"]
        data = cache["archive"] && cache["archive"][repo] && cache["archive"][repo][day.to_s]
        data
      end

      def repo_from_archive(repo)
        repo_data_for(repo, today)
      end

      def repo_from_api(repo)
        puts "Syncing: #{repo.inspect}"

        topics_resp = JSON.parse(fetch_repo_topics(repo))
        topics_key = "topics".freeze
        topics = topics_resp["names"]

        JSON.parse(fetch_repo(repo)).tap do |data|
          unless repo_from_archive(repo)
            cache["archive"] ||= {}
            cache["archive"][repo] ||= {}
            cache["archive"][repo][topics_key] = topics
            cache["archive"][repo][today.to_s] = {
              "size" => data["size"],
              "stargazers_count" => data["stargazers_count"],
              "watchers_count" => data["watchers_count"],
              "forks_count" => data["forks_count"],
              "open_issues_count" => data["open_issues_count"],
              "forks" => data["forks"],
              "open_issues" => data["open_issues"],
              "watchers" => data["watchers"],
              "network_count" => data["network_count"],
              "subscribers_count" => data["subscribers_count"]
            }

            if cache["archive"][repo]["current"] != today.to_s
              cache["archive"][repo]["last"] = cache["archive"][repo]["current"]
              cache["archive"][repo]["current"] = today.to_s
            end


            cache["updated"] = true
            store_cache!
          end
        end
      end

      def fetch_archive
        # gist = JSON.parse(api_request(archive_uri)) rescue nil
        # # Temporary workaround
        # data = JSON.parse(gist["files"]["data.json"]["content"])
        # cache["archive"] = data
        cache["archive"] = JSON.parse(File.read(LOCAL_ARCHIVE))
      rescue => e
        puts "Error fetching gist with archived data: #{e}"
      end

      # not used with local cache
      def archive_uri
        "https://api.github.com/gists/#{ENV["GIST_ID"]}"
      end

      def fetch_repo(repo)
        api_request("https://api.github.com/repos/#{repo}")
      end

      def fetch_repo_topics(repo)
        api_request("https://api.github.com/repos/#{repo}/topics", accept: 'application/vnd.github.mercy-preview+json')
      end

      def fetch_repo_readme_html(repo)
        api_request("https://api.github.com/repos/#{repo}/readme", accept: 'application/vnd.github.v3.html')
      end

      def fetch_repo_readme(repo)
        api_request("https://api.github.com/repos/#{repo}/readme", accept: 'application/vnd.github.v3.raw')
      end

      def api_request(url, options = {})
        raise(ArgumentError.new("Missing GITHUB_TOKEN=something")) unless ENV["GITHUB_TOKEN"]
        sleep(1)

        uri = URI.parse(url)
        req = METHODS[options[:method] || :get].new(uri.path)

        # req['Authorization'] = "token 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"
        req['Authorization'] = "token #{ENV['GITHUB_TOKEN']}" if ENV["GITHUB_TOKEN"]

        if options[:accept]
          req['Accept'] = options[:accept]
        end

        if options[:body]
          req.body = JSON.generate(options[:body])
          req.content_type = "application/json"
        end

        res = Net::HTTP.start(uri.hostname, uri.port, :use_ssl => true) { |http|
          http.request(req)
        }

        code = res.code.to_i

        unless code >= 200 && code <= 300
          puts "Error communicating with Github #{uri} (#{code}): #{res.inspect}"
          rdata = uri.to_s.gsub("https://api.github.com/repos/", '').gsub("/topics", '')
          if code == 301
            @moved ||= []
            puts JSON.parse(res.body)
            @moved.push(rdata)
          end

          if code == 404
            @not_found ||= []
            @not_found.push(rdata)
          end

          return "{}"
          # raise message
        end
        res.body
      end

      def today
        Date.today.to_s
      end
    end
  end
end
