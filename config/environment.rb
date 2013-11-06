# Load the Rails application.
require File.expand_path('../application', __FILE__)

# Credentials for login to private repos - set your credentials in your local .bash_profile by adding 'export ENV_VARIABLE="your_username_pwd_etc"'
# ENV_VARIABLE corresponds to what is inside the ENV block below

GITHUB_ORG = ENV['CAMELBACK_GITHUB_ORG']
CAMELBACK_WEB_USER = ENV['CAMELBACK_WEB_USER']
CAMELBACK_WEB_PWD = ENV['CAMELBACK_WEB_PWD']
GITHUB_CAMELBACK_OAUTH_CLIENT_ID = ENV['GITHUB_CAMELBACK_OAUTH_CLIENT_ID']
GITHUB_CAMELBACK_OAUTH_CLIENT_SECRET = ENV['GITHUB_CAMELBACK_OAUTH_CLIENT_SECRET']
GITHUB_PERSONAL_ACCESS_TOKEN = ENV['GITHUB_PERSONAL_ACCESS_TOKEN']

# Initialize the Rails application.
WebAppRails::Application.initialize!
