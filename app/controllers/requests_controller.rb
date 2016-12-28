class RequestsController < ApplicationController
  def new
    @user = User.find_by_id(session[:user_id])
    if @user == nil or @user.year == nil or @user.major == ""
      session[:user_id] = nil
      redirect_to root_path
    else
      @request = Request.new
    end
  end

  def show
    @user = User.find_by_id(session[:user_id])
    if @user == nil or @user.year == nil or @user.major == ""
      session[:user_id] = nil
      redirect_to root_path
    else
      @request = Request.find_by_id(params[:id])
    end
  end

  def by_course
    @user = User.find_by_id(session[:user_id])
    if @user == nil or @user.year == nil or @user.major == ""
      session[:user_id] = nil
      redirect_to root_path
    else
      @requests = Request.where(:course => params[:id])

    end
  end 

  def create
    @request = Request.new(request_params)
    if @request
      @request.creation = Time.now
      @request.user = session[:user_id]
      @request.expiration = Time.now + @request.duration.to_int.hour
      @request.save!
      flash[:success] = "Request Created!"
      redirect_to '/dashboard'
    else
      render 'new'
    end

  end

  def edit
  end

  def update
  end

  def delete
  end

  def show_all
    @user = User.find_by_id(session[:user_id])
    if @user == nil or @user.year == nil or @user.major == ""
      session[:user_id] = nil
      redirect_to root_path
    else
      @requests = Request.all
    end
  end
  def request_params
    #params["request"]["topics"] = params["request"]["topics"].split(",")
    params.require(:request).permit(:course, :description, :location, :duration, :need_help, :topics)
  end
end
