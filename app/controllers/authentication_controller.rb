class AuthenticationController < ApplicationController

  def index
    @user = User.new
  end

  def authentication
    user = User.find_by login: post_params[:login],
      password: Digest::MD5.hexdigest(post_params[:password])
    if user 
    
        session[:user_id] = user.id
      
    end


   # render json: session
    if session[:last_url]
     redirect_to session[:last_url]
    else
      redirect_to '/admin'
    end
  end

  private

  def post_params
    params.require(:user).permit(:login, :password)
  end


end
