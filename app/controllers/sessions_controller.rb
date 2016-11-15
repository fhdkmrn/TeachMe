class SessionsController < ApplicationController

  def create
    user = User.from_omniauth(env["omniauth.auth"])
    session[:user_id] = user.id
    if (user.year == nil)
    	redirect_to '/signup'
    else
    	redirect_to_root_path
    end
  end
 
  def destroy
    session[:user_id] = nil
    redirect_to root_path
  end
end
