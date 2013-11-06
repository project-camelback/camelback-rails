source 'http://rubygems.org'

# DEFAULT GEMS
# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.0.0'

# Use PostgreSQL. Heroku requires it.
gem 'pg'

# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'

# Use CoffeeScript for .js.coffee assets and views
gem 'coffee-rails', '~> 4.0.0'

# See https://github.com/sstephenson/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

# Use jquery as the JavaScript library
gem 'jquery-rails'

# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks'

# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 1.2'

group :doc do
  # bundle exec rake doc:rails generates the API under doc/api.
  gem 'sdoc', require: false
end

#PROD
group :production do
  gem 'rails_12factor'
end

#DEV
group :development do
  gem 'pry'
  gem 'annotate', ">=2.5.0"
end

# GITHUB
gem 'octokit'

#PRESENTATION
gem 'sass-rails', '~> 4.0.0'
gem 'compass-rails', "~> 2.0.alpha.0", :group => :assets
gem 'compass_twitter_bootstrap'

gem 'rest-client'

#gem "compass-rails",  github: "milgner/compass-rails", branch: 'rails4'

# Use ActiveModel has_secure_password
# gem 'bcrypt-ruby', '~> 3.0.0'

# Use unicorn as the app server
# gem 'unicorn'

# Use Capistrano for deployment
# gem 'capistrano', group: :development

# Use debugger
# gem 'debugger', group: [:development, :test]

# Heroku demands ruby 2.0.0
ruby "2.0.0"