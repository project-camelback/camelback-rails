class UsersController < ApplicationController

  def login
    # binding.pry
    url = "https://github.com/login/oauth/authorize?client_id=#{GITHUB_CAMELBACK_OAUTH_CLIENT_ID}"
    redirect_to url
  end

end
