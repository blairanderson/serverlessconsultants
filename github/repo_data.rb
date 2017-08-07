require './github/project'
require './github/api'

module Github
  class RepoData
    def initialize(app, extension)
      @app = app
      @extension = extension
      @projects = []
      @languages = Hash.new(0)
    end

    def projects
      @projects.sort_by {|project| project.stars }
    end

    def languages
      @languages.keys.sort.uniq { |language| language.downcase }
    end

    def manipulate_resource_list(resources)
      @projects = []

      localrepo = Class.new do
        extend Project
        include Project
        attr_reader :data
        def initialize(resource)
          @data = resource
        end
      end

      API.bulk do
        resources.each do |resource|
          repo = localrepo.new(resource)
          repo.repo_data # Trigger a repo fetch
          @projects << repo
          @languages[repo.language] += 1
        end
      end

      resources
    end
  end
end
