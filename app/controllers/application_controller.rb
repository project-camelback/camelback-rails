class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception



  #before_action :require_login

  # def require_login
  #   if current_user
  #     redirect_to root_path
  #   else
  #      redirect_to login_path
  #    end
  #   # redirect_to login_path if current_user.nil? # session[:user_id]    
  # end


  private

    # def require_login
    #   unless logged_in?
    #     redirect_to login_path
    #   end
    # end


    def current_user
      if User.all.empty?
        redirect_to login_path
      else
        @current_user ||= User.find(session[:user_id]) if session[:user_id]
      end
    end
    helper_method :current_user
end
