class HomeController < ApplicationController
  def show
  	user = User.find_by_id(session[:user_id])

  	if user != nil
  		if user.year == nil or user.major == ""
  			@user = User.find_by_id(session[:user_id])
  			session[:user_id] = nil
  		else
  			@user = User.find_by_id(session[:user_id])
  			redirect_to '/dashboard'
  		end
  	end
  end

  def create
  	@user = User.find_by_id(session[:user_id])
  	if @user.year != nil
  		redirect_to '/dashboard'
  	end
  	if @user == nil
  		redirect_to '/'
  	end

  end

  def new
  	user = User.find_by_id(session[:user_id])
  	if user.update_attributes(user_params) and user.year != nil and user.major != ""
  		redirect_to '/dashboard'
  	else
  		@user = User.find_by_id(session[:user_id])

  		render 'create'
  	end
  end


  private
  def user_params
	params.require(:user).permit(:name, :email, :major, :year, :study_spot)
  end

end
