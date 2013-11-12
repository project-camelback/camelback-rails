class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  helper_method :current_user
  helper_method :student_user

  private
    def current_user
      @current_user ||= User.find(session[:user_id]) if !User.all.empty? 
    end
    
    def student_user
    	current_user
    	@student_user = Student.find_by(:name => @current_user.login)
    end
end
