source 'http://rubygems.org'

# Heroku demands ruby 2.0.0
ruby "2.0.0"

gem 'pg'
gem 'rails', '4.0.0'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.0.0'
gem 'jquery-rails'
gem 'turbolinks'
gem 'jbuilder', '~> 1.2'
gem 'octokit'
gem 'omniauth-github', :git => 'git://github.com/intridea/omniauth-github.git'
gem 'rest-client'
gem 'sass-rails', '~> 4.0.0'
gem 'compass-rails', "~> 2.0.alpha.0", :group => :assets
gem 'bootstrap-sass', '~> 3.0.1.0.rc'
gem 'acts-as-taggable-on'
gem 'feedzirra'
gem 'griddler'

group :development do
  gem 'sqlite3'
  gem 'pry'
  gem 'annotate', ">=2.5.0" 
  gem 'pg'
  #gem "compass-rails",  github: "milgner/compass-rails", branch: 'rails4'
end

group :test do
  gem 'sqlite3'
  gem 'guard'
  gem 'guard-rspec'
  gem 'terminal-notifier-guard'
  gem 'rack-test'
  gem 'awesome_print'
end

group :production do
  gem 'rails_12factor'
  gem 'pg' # Use PostgreSQL. Heroku requires it
end

group :doc do
  # bundle exec rake doc:rails generates the API under doc/api.
  gem 'sdoc', require: false
end

# FROM GRADER APP
gem 'git'
gem 'oj'
gem 'chronic'
gem 'rake'