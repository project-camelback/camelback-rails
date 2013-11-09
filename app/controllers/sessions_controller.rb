class SessionsController < ApplicationController
  def create
    user = User.from_omniauth(auth_hash)
    session[:user_id] = user.id
    redirect_to root_url, notice: "Signed in"
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url, notice: "Signed out."
  end

  protected
    def auth_hash
      raise request.env['omniauth.auth'].inspect
    end
end
