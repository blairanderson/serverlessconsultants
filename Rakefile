require './github/extension'
require 'active_support/core_ext/date'
require 'active_support/core_ext/time'
require 'active_support/core_ext/hash'
require 'active_support/core_ext/string'
require 'pry'
require 'fast_blank'
require 'dotenv'
require "tmpdir"
require "jekyll"

LIST = [
  :fetch_serverless_plugin_list,
  :sync_github_projects,
  :sync_github_topics
]

# BUNCH OF ALIASES
desc "fetch github repos and create a bunch of files"
task :plugins => LIST
desc "fetch github repos and create a bunch of files"
task :github => LIST
desc "fetch github repos and create a bunch of files"
task :refresh => LIST
desc "fetch github repos and create a bunch of files"
task :sync => LIST
task 'default' => LIST + [:deploy]

task :fetch_serverless_plugin_list do
  puts 'FETCHES PLUGIN LIST FROM https://github.com/serverless/plugins'
  system "node sync.js"
  puts 'synced'
end

task :sync_github_projects do
  app = OpenStruct.new
  extension = Github::Extension.new(app, Dotenv.load)
  extension.sync

  # IF FILE EXISTS, DO NOTHING
  # IF FILE DOES NOT EXIST
  # CREATE THE FILE AND FETCH THE README!
  extension.app.github.projects.each do |p|
    filename = "plugins/#{p.name}.md"
    puts p.inspect
    next if filename.include?("@")

    # TODO: also fetch keywords from package.json and marge/dedupe them
    # https://github.com/npm/registry/blob/master/docs/responses/package-metadata.md
    readme = Github::API.fetch_repo_readme(p.repo)
    File.open(filename, 'w+') do |post|
      post.puts "---"
      post.puts "layout: plugin"
      post.puts "title: #{p.repo.split("/").last.titleize}"
      post.puts "repo: #{p.repo}"
      post.puts "homepage: '#{p.homepage}'"
      post.puts "description: '#{CGI::escapeHTML(p.description)}'"
      %i[stars stars_trend stars_diff forks forks_trend forks_diff watchers issues issues_trend issues_diff].each do |attr|
        post.puts "#{attr}: #{p.send(attr)}" if p.send(attr)
      end
      post.puts "---"
      post.puts ""
      post.puts ""
      post.puts readme
    end
  end
end

task :sync_github_topics do
  # create topics
  topics = Github::API.fetch_archive
    .map{|repo, data| data["topics"] } # get all the topics
    .flatten
    .inject(Hash.new(0)) { |h, e| h[e] += 1 ; h } # group && count
    .each do |name,count|
      next if name.blank?
      topic_filename = "plugins/topics/#{name}.md"
      File.open(topic_filename, 'w+') do |post|
        post.puts "---"
        post.puts "# NOTE: THIS FILE IS GENERATED - DO NOT ATTEMPT TO CREATE A PULL REQUEST TO UPDATE THE DATA. "
        post.puts "layout: topic"
        post.puts "topic: #{name}"
        post.puts "title: #{name} Serverless Plugins"
        post.puts "description: '#{count} #{name} ServerLess Plugins'"
        post.puts "count: #{count}"
        post.puts "---"
      end
    end
end

# Change your GitHub reponame
GITHUB_REPONAME = "blairanderson/serverlessconsultants"

desc "Generate blog files"
task :generate do
  ENV['JEKYLL_ENV'] = 'production'
  Jekyll::Site.new(Jekyll.configuration({
    "source"      => ".",
    "destination" => "docs"
  })).process
end

task :deploy do
  message = "Site updated at #{Time.now.utc}"
  system "git add ."
  system "git commit -m #{message.inspect}"
  system "git push origin master"
end

task :cleanup do
  FileUtils.rm_f(Dir.glob("docs/**/*"))
end

task :newsletter do
  data_hash = JSON.parse(File.read('_data/serverless_plugins.json'))
  puts data_hash.length
  last_month = (Date.today - 1.month)
  this_month = data_hash.select do |plugin|
    plugin['created'] && Time.parse(plugin['created']).between?(last_month.beginning_of_month, last_month.end_of_month)
  end
  puts this_month.length
  puts this_month.sort_by{|a| -a['last-month'] }
  puts data_hash.sort_by{|a| -a['last-month'] }.first(10)
end
