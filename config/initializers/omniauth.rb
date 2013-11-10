OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :github, ENV['GITHUB_CAMELBACK_OAUTH_CLIENT_ID'], ENV['GITHUB_CAMELBACK_OAUTH_CLIENT_SECRET'], scope: "user,repo,gist", redirect_uri: 'http://camelback-app.herokuapp.com/auth/github/callback'
end	