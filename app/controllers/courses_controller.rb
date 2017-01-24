class CoursesController < ApplicationController
  before_action :set_course, only: [:show, :edit, :update, :destroy]
  # GET /courses
  # GET /courses.json

  def index
    @courses = Course.all
    redirect_to '/dashboard'
  end

  # GET /courses/1
  # GET /courses/1.json
  def show
    @user = User.find_by_id(session[:user_id])
    @course = Course.find_by_id(params[:id])
    if @user == nil or @user.year == nil or @user.major == ""
      session[:user_id] = nil
      redirect_to root_path
    else
      if @course == nil
        render '404.html'
      end
      @requests = Request.where(:course => params[:id])

    end
  end

  # GET /courses/new
  def new
    @course = Course.new
  end

  # GET /courses/1/edit
  def edit
  end

  def search
    redirect_to course_requests_path(params[:course])
  end

  def unstar
    @user =User.find_by_id(params[:user])
    @course = Course.find_by_id(params[:course])
    @user.starred.delete(@course.id.to_s)
    @user.save!
    redirect_to :back
  end

  def star
    @user =User.find_by_id(params[:user])
    @course = Course.find_by_id(params[:course])
    @user.starred.append(@course.id.to_s)
    @user.save!
    redirect_to :back

  end

  # POST /courses
  # POST /courses.json
  def create
    @course = Course.new(course_params)

    respond_to do |format|
      if @course.save
        format.html { redirect_to @course, notice: 'Course was successfully created.' }
        format.json { render :show, status: :created, location: @course }
      else
        format.html { render :new }
        format.json { render json: @course.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /courses/1
  # PATCH/PUT /courses/1.json
  def update
    respond_to do |format|
      if @course.update(course_params)
        format.html { redirect_to @course, notice: 'Course was successfully updated.' }
        format.json { render :show, status: :ok, location: @course }
      else
        format.html { render :edit }
        format.json { render json: @course.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /courses/1
  # DELETE /courses/1.json
  def destroy
    @course.destroy
    respond_to do |format|
      format.html { redirect_to courses_url, notice: 'Course was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_course
      @course = Course.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def course_params
      params.fetch(:course,:name,:course_number,:department)
    end
end
