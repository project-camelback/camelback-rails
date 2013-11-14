class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :require_login

  def require_login
    redirect_to login_path unless current_user  
  end


  private

    def current_user
      if User.all.empty?
        redirect_to login_path
      else
        @current_user ||= User.find(session[:user_id]) if session[:user_id]
        # @grav_url = Student.find_by(:name => current_user.login).assignments.first.gravatar_url
      end
    end
    helper_method :current_user

end
