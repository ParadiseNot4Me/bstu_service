class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :null_session

  def auth
  	 if session[:user_id] == nil
  	 	session[:last_url] = request.original_url
 		redirect_to authentication_url
  	 else 
  	 	return true
  	 end
  end
end
