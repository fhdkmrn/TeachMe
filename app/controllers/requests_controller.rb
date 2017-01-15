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
      if @request == nil
        render '404.html'
      end
    end
  end

  def create
    @request = Request.new(request_params)
    if @request
      @request.creation = Time.now
      @request.user = session[:user_id]
      @request.expiration = Time.now + @request.duration.to_int.minutes
      @request.save!
      redirect_to '/dashboard'
      flash[:success] = "Request Created!"

    else
      render 'new'
    end

  end

  def edit
    @request = Request.find(params[:id])
  end

  def update
    @request = Request.find(params[:id])
    @request.update_attributes(request_params)
    redirect_to request_path(@request.id)
    flash[:success] = "Request updated"
  end

  def send_acceptance_mail
    request = Request.find_by_id(params[:request])
    user = User.find_by_id(params[:user])
    @feedback = Feedback.new
    @feedback.tutor = user.id
    @feedback.tutoree = request.user
    @feedback.request = request.id
    @feedback.save!
    if request.need_help 
      RequestMailer.need_help_accepted(user, request).deliver_now
    else 
      RequestMailer.giving_help_accepted(user, request).deliver_now
    end
    request.accepted_by = user.id
    request.save!
    redirect_to root_path

  end


  def destroy
    @request = Request.find(params[:id])
    @request.delete
    redirect_to '/requests'
    flash[:success] = "Request Deleted"


  end

  def index
    @user = User.find_by_id(session[:user_id])
    if @user == nil or @user.year == nil or @user.major == ""
      session[:user_id] = nil
      redirect_to root_path
    else
      @requests = Request.all
    end
  end

  private 
    def request_params
      #params["request"]["topics"] = params["request"]["topics"].split(",")
      params.require(:request).permit(:course, :description, :location, :duration, :need_help, :topics)
    end
end
