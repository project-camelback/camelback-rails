class UsersController < ApplicationController

  def login
    # binding.pry
    url = "https://github.com/login/oauth/authorize?client_id=#{GITHUB_CAMELBACK_OAUTH_CLIENT_ID}&scope=repo,gist"
    redirect_to url
  end

  def callback
    # get temporary GitHub code...
    session_code = request.env['rack.request.query_hash']["code"]

    result = RestClient.post("https://github.com/login/oauth/access_token",
        {:client_id => GITHUB_CAMELBACK_OAUTH_CLIENT_ID,
         :client_secret => GITHUB_CAMELBACK_OAUTH_CLIENT_SECRET,
         :code => session_code
        },{
         :accept => :json
        })

    session[:access_token] = JSON.parse(result)["access_token"]

    redirect_to root_path
  end
end
