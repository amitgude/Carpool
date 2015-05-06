class SessionsController < ApplicationController
 
  def create
    user=User.from_omniauth(request.env["omniauth.auth"])
    session[:user_id] = user.id
    sign_in(:user, user)
    flash[:alert]= "you have successfully logged in using facebook"
    redirect_to root_url
  end

  def destroy
    session[:user_id] = nil
    session.clear
    redirect_to root_url
  end
end