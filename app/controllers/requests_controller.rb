class RequestsController < ApplicationController

  def confirmRequest
    request = Request.find_by_id(params[:request])
    user1 = User.find_by_id(params[:user])
    user2 = User.find_by_id(request.user)
    request.accepted_by = user1.id
    request.save!
    RequestMailer.send_contact_info(user1, user2, request).deliver_now
    RequestMailer.send_contact_info(user2, user1, request).deliver_now
    flash[:success] = "You have accepted the request! Both parties will recieve an email with information on how to contact each other."
    # Maybe link to its own page? Look at calteachme.com/courses for example
    @feedback = Feedback.new
    if request.need_help
      @feedback.tutor = user1.id
      @feedback.tutoree = request.user
    else
      @feedback.tutor = request.user
      @feedback.tutoree = user1.id
    end
    @feedback.request = request.id
    @feedback.save!
    redirect_to root_path
  end

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
    if not Course.exists?(:full_title => request_params[:course])
      flash[:danger] = "Please select a valid course!"
      redirect_to '/requests/new'
    else
      now = Time.now
      @request = Request.new({
        :need_help => request_params[:need_help],
        :course => Course.where(:full_title => request_params[:course]).first.id.to_s,
        :description => request_params[:description],
        :topics => request_params[:topics],
        # :duration => request_params[:duration],
        :location => request_params[:location],
        :start_time => DateTime.new(now.year,now.month,now.day,request_params["start_time(4i)"].to_i,request_params["start_time(5i)"].to_i,0),
        :end_time =>  DateTime.new(now.year,now.month,now.day,request_params["end_time(4i)"].to_i,request_params["end_time(5i)"].to_i,0)

        })

      if @request
        @request.creation = Time.now
        @request.user = session[:user_id]
        @request.expiration = @request.end_time
        
        @request.save!
        redirect_to '/dashboard'
        flash[:success] = "Request Created!"
      else
        redirect_to 'new'
      end
    end
  end

  def edit
    @request = Request.find(params[:id])
    if @request.user.to_i != current_user.id
      flash[:danger] = "You are not authorized to access this page."
      redirect_to "/"
    end
  end

  def update
    @request = Request.find(params[:id])
    @request.update_attributes(request_params)
    redirect_to request_path(@request.id)
    flash[:success] = "Request updated"
  end

  def send_acceptance_mail
    puts("DADDDY")
    request = Request.find_by_id(params[:request])
    user = User.find_by_id(params[:user])
    accepted_location = params[:accepted_location]
    info = params[:info]
    puts("DADDDY")
    if request.need_help
      RequestMailer.need_help_accepted(user, request, accepted_location, info).deliver_now
    else
      RequestMailer.giving_help_accepted(user, request, accepted_location, info).deliver_now
    end
    redirect_to root_path
  end


  def send_acceptance_info
    @request = Request.find_by_id(params[:request])
    @user = User.find_by_id(params[:user])
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
      params.require(:request).permit(:course, :description, :location, :duration, :need_help, :topics, :start_time, :end_time)
    end
end
