require './github/extension'
require 'active_support/core_ext/hash/indifferent_access'
require 'pry'
require 'fast_blank'
require 'dotenv'

def before_sync
  Dotenv.load
  puts 'syncing plugins'
  system "gulp sync:plugins"
  puts 'plugins synced'
end

desc "fetch github repos and stuff"
task :github do
  before_sync
  app = OpenStruct.new
  extension = Github::Extension.new(app)
  extension.sync
  # create projects
  extension.app.github.projects.each do |p|
    folder = "plugins/"
    puts p.inspect
    File.open("#{folder}#{p.name}.md", 'w+') do |post|
      post.puts "---"
      post.puts "# NOTE: THIS FILE IS GENERATED FROM YOUR GITHUB REPO"
      post.puts "layout: plugin"
      post.puts "title: #{p.repo.split("/").last}"
      post.puts "repo: #{p.repo}"
      post.puts "homepage: '#{p.homepage}'"
      post.puts "topics: #{p.topics.join(",")}"
      %i[language license description watchers stars stars_trend stars_diff forks forks_trend forks_diff issues issues_trend issues_diff].each do |attr|
        post.puts "#{attr}: #{p.send(attr)}"
      end
      post.puts "---"
    end
  end

  # create topics
  topics = extension.app.github.projects
    .map(&:topics)
    .flatten
    .inject(Hash.new(0)) { |h, e| h[e] += 1 ; h }
    .select{|name, value| value > 0 }
    .each do |name,count|
      folder = "plugins/topics/"
      File.open("#{folder}#{name}.md", 'w+') do |post|
        post.puts "---"
        post.puts "# NOTE: THIS FILE IS GENERATED - DO NOT ATTEMPT TO CREATE A PULL REQUEST TO UPDATE THE DATA. "
        post.puts "layout: topic"
        post.puts "topic: #{name}"
        post.puts "title: #{name} ServerLess Plugins"

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
  Jekyll::Site.new(Jekyll.configuration({
    "source"      => ".",
    "destination" => "docs"
  })).process
end

desc "Generate and publish blog to gh-pages"
task :publish => [:generate] do
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
