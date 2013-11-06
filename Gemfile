source 'http://rubygems.org'
ruby "2.0.0" # Heroku demands ruby 2.0.0

gem 'rails', '4.0.0'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.0.0'
gem 'jquery-rails'
gem 'turbolinks'
gem 'jbuilder', '~> 1.2'
gem 'octokit'
gem 'rest-client'
gem 'sass-rails', '~> 4.0.0'
gem 'compass-rails', "~> 2.0.alpha.0", :group => :assets
gem 'zurb-foundation', '~> 4.0.0', :group => :assets
gem 'pry', :group => :development
gem 'annotate', ">=2.5.0", :group => :development

group :development do
  gem 'sqlite3'
  gem 'pry'
  gem 'annotate', ">=2.5.0" 
  #gem "compass-rails",  github: "milgner/compass-rails", branch: 'rails4'
end

group :production do
  gem 'rails_12factor'
  gem 'pg' # Use PostgreSQL. Heroku requires it
end

group :doc do
  # bundle exec rake doc:rails generates the API under doc/api.
  gem 'sdoc', require: false
end
