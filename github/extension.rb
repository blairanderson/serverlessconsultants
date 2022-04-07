require './github/repo_data'
require './github/helper'
require 'json'
require 'ostruct'

module Github
  class Extension
    attr_accessor :app, :options

    def initialize(app, options_hash={})
      @app = app
      @options = options_hash
    end

    def sync
      app.github = RepoData.new(app, self)

      plugins = JSON.parse(File.read('./_data/serverless_plugins.json')).map do |datum|
        plugin = OpenStruct.new(datum)
        next unless plugin.githubUrl.include?("https://github.com/")
        next if plugin.githubUrl.include?("gitlab.com")
        next if plugin.githubUrl.include?("@")
        next if plugin.githubUrl.gsub("https://github.com/", '').split("/").size > 2
        plugin.homepage = plugin.githubUrl
        plugin.repo = plugin.githubUrl.split("github.com/").last
        plugin
      end.compact

      app.github.manipulate_resource_list(plugins)
    end

  end
end
