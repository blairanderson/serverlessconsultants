require './github/extension'
require 'active_support/core_ext/hash'
require 'active_support/core_ext/string'
require 'pry'
require 'fast_blank'
require 'dotenv'

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
task 'default' => LIST

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

    # TODO: also fetch keywords from package.json and marge/dedupe them
    # https://github.com/npm/registry/blob/master/docs/responses/package-metadata.md
    readme = Github::API.fetch_repo_readme(p.repo)
    File.open(filename, 'w+') do |post|
      post.puts "---"
      post.puts "layout: plugin"
      post.puts "title: #{p.repo.split("/").last.titleize}"
      post.puts "repo: #{p.repo}"
      post.puts "homepage: '#{p.homepage}'"
      post.puts "description: '#{p.description}'"
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

require "tmpdir"
require "jekyll"

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

desc "Generate and publish blog to gh-pages"
task :publish => [:deploy, :cleanup]

task :deploy => [:generate] do
  message = "Site updated at #{Time.now.utc}"
  Dir.mktmpdir do |tmp|
    cp_r "docs/.", tmp

    pwd = Dir.pwd
    Dir.chdir(tmp)
    system "git init"
    system "git add ."
    system "git commit -m #{message.inspect}"
    system "git remote add origin git@github.com:#{GITHUB_REPONAME}.git"
    system "git push origin master:refs/heads/gh-pages --force"
    Dir.chdir(pwd)
  end
end

task :cleanup do
  FileUtils.rm_f(Dir.glob("docs/**/*"))
end
