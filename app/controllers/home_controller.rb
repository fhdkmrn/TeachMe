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
  	if user.update_attributes(user_params)
  		redirect_to '/dashboard'
  	# else
  	# 	@user = User.find_by_id(session[:user_id])

  	# 	render 'create'
  	end
  end

  def others
    @user = User.find_by_id(session[:user_id])
    if @user == nil or @user.year == nil or @user.major == ""
      session[:user_id] = nil
      redirect_to root_path
      if session[:user_id].to_s == params[:id].to_s:
        redirect_to '/my_profile'
      end
      if User.find_by_id(params[:id]).nil?
        render '404.html'
      else
        @user = User.find_by_id(params[:id])
        @requests = Requests.where(:user => params[:id])
      end
    end
  end


  def profile
    @user = User.find_by_id(session[:user_id])

    if @user == nil or @user.year == nil or @user.major == ""
      session[:user_id] = nil
      redirect_to root_path
    else
      @requests = Requests.where(:user => session[:user_id])
    end
  end


  private
  def user_params
	params.require(:user).permit(:name, :email, :major, :year, :study_spot)
  end

end
