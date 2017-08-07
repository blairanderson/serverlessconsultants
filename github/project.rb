module Github
  module Project
    [:name, :repo, :startertemplaterepo, :homepage, :license, :templates, :description].each do |attr|
      define_method attr do
        data[attr]
      end
    end

    def language
      repo_data[:language]
    end

    def title
      repo_data[:title]
    end

    def stars
      repo_data[:stargazers_count] || 0
    end

    def forks
      repo_data[:forks]
    end

    def watchers
      repo_data[:watchers_count]
    end

    def topics
      repo_data[:topics] || []
    end

    def issues
      repo_data[:open_issues]
    end

    def stars_last_week
      last_week.stars
    end

    def forks_last_week
      last_week.forks
    end

    def issues_last_week
      last_week.issues
    end

    def stars_diff
      return 0 unless stars_last_week
      stars - stars_last_week
    end

    def forks_diff
      return 0 unless forks_last_week
      forks - forks_last_week
    end

    def issues_diff
      return 0 unless issues_last_week
      issues - issues_last_week
    end

    def stars_trend
      trend(stars_diff)
    end

    def forks_trend
      trend(forks_diff)
    end

    def issues_trend
      trend(issues_diff)
    end

    def trend(diff)
      diff == 0 ? "" : (diff > 0 ? "up" : "down")
    end

    def last_week
      oldest_data = nil
      # return the first starting with the oldest
      7.downto(0).each do |number|
        oldest_data = days_ago(number)
        break if oldest_data && (
          (oldest_data.stars && oldest_data.stars > 0) ||
            (oldest_data.forks && oldest_data.forks > 0) ||
            (oldest_data.issues && oldest_data.issues > 0)
        )
      end

      oldest_data
    end

    def week_history
      (0..7).map do |days|
        days_ago(days)
      end.reverse.tap do |days|
        days.each_with_index do |day,index|
          if index > 0 && day.stars.nil?
            days[index] = days[index - 1]
          end
        end
      end
    end

    def days_ago(days)
      time = Date.today - days
      point_in_time(time, repo_data(time) || Hash.new(0))
    end

    def repo_data(day = nil)
      day ? API.repo_data_for(repo, day) : API.repo_data(repo)
    end

    def render(opts={}, locs={}, &block)
      super(opts.merge(:layout => "project.erb"), locs, &block)
    end

    def point_in_time(datestamp, data)
      data = data || Hash.new(0)
      Struct.new(:datestamp, :stars, :forks, :issues).new(datestamp, data[:stargazers_count], data[:forks], data[:open_issues])
    end
  end
end
