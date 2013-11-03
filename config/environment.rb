# Load the Rails application.
require File.expand_path('../application', __FILE__)

# Credentials for login to private repos - set your credentials in your local .bash_profile by adding 'export ENV_VARIABLE="your_username_pwd_etc"'
GITHUB_USERNAME = ENV['CAMELBACK_GITHUB_USERNAME']
GITHUB_PWD = ENV['CAMELBACK_GITHUB_PWD']
GITHUB_ORG = ENV['CAMELBACK_GITHUB_ORG']
CAMELBACK_WEB_USER = ENV['CAMELBACK_WEB_USER']
CAMELBACK_PWD = ENV['CAMELBACK_WEB_PWD']

# Initialize the Rails application.
WebAppRails::Application.initialize!
