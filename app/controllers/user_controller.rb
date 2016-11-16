class UserController < ApplicationController
  def dashboard
  	@user = User.find_by_id(session[:user_id])
  	if @user == nil or @user.year == nil or @user.major == ""
  		session[:user_id] = nil

  		redirect_to root_path
  	end

  end
end
