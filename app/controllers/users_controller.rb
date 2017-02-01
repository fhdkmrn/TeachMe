class UsersController < ApplicationController
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
  		redirect_to root_path
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
    else
      if session[:user_id].to_s == params[:id].to_s
        redirect_to '/users/my_profile'

      else
        @otherUser = User.find_by_id(params[:id])
        if @otherUser == nil
          render '404.html'
        else
          @requests = Request.where(:user => params[:id])
        end
      end
      # end
    end
  end


  def profile
    @user = User.find_by_id(session[:user_id])

    if @user == nil or @user.year == nil or @user.major == ""
      session[:user_id] = nil
      redirect_to 'root_path'
    else
      @feedbacks = Feedback.where(:tutor => session[:user_id])
      @requests = Request.where(:user => session[:user_id])
    end
  end

  def edit
    @user = User.find(session[:user_id])
  end

  def update
    @user = User.find(session[:user_id])
    @user.update_attributes(user_params)
    redirect_to "/users/my_profile"
    flash[:success] = "Profile information Successfully Updated"
  end

  private
  def user_params
	params.require(:user).permit(:name, :email, :major, :year, :study_spot)
  end

end
