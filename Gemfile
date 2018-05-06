# -*- coding: utf-8 -*-
source 'https://rubygems.org'

gem 'chef', '~> 12'
gem 'berkshelf'
gem 'rake'

group :lint do
  gem 'cookstyle'
  gem 'foodcritic'
end

group :unit do
  gem 'chefspec'
end

group :kitchen do
  gem 'test-kitchen', '= 1.4.2'
  gem 'kitchen-docker', '=2.3.0'
end

group :development do
  gem 'guard'
  gem 'guard-foodcritic'
  gem 'guard-rubocop'
  gem 'guard-rspec'
end
