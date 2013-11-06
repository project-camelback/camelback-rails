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

group :doc do
  # bundle exec rake doc:rails generates the API under doc/api.
  gem 'sdoc', require: false
end



group :development do
  gem 'sqlite3'
  gem 'pry'
  gem 'annotate', ">=2.5.0" 
  #gem "compass-rails",  github: "milgner/compass-rails", branch: 'rails4'
end

gem 'compass-rails', "~> 2.0.alpha.0", :group => :assets
gem 'compass_twitter_bootstrap'
gem 'sass-rails', '~> 4.0.0'

group :production do
  gem 'rails_12factor'
  # Use PostgreSQL. Heroku requires it
  gem 'pg'
end


# Use ActiveModel has_secure_password
# gem 'bcrypt-ruby', '~> 3.0.0'

# Use unicorn as the app server
# gem 'unicorn'

# Use Capistrano for deployment
# gem 'capistrano', group: :development

# Use debugger
# gem 'debugger', group: [:development, :test]