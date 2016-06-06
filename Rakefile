# -*- coding: utf-8 -*-

def bundle_exec(command)
  sh "bundle exec #{command}"
end

task :vendor do
  rm_rf 'cookbooks'
  bundle_exec 'berks vendor cookbooks'
end

namespace :test do
  desc 'Tests suites runner'

  task :checkstyle do
    Rake::Task['test:foodcritic'].invoke
    Rake::Task['test:rubocop'].invoke
  end

  task :specs do
    Rake::Task['test:chefspec'].invoke
  end

  task :foodcritic do
    bundle_exec 'foodcritic -f any .'
  end

  task :rubocop do
    bundle_exec :rubocop
  end

  task :chefspec do
    bundle_exec :rspec
  end

  task :kitchen do
    bundle_exec 'kitchen test'
  end
end

task default: ['test:checkstyle', 'test:specs']