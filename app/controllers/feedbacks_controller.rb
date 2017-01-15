class FeedbacksController < ApplicationController
  def new
    @user = User.find_by_id(session[:user_id])
	@feedback = Feedback.new
  end

  def create
    @feedback = Feedback.new(feedback_params)
    @feedback.save!
  end

  def edit
    @feedback = Feedback.find(params[:id])
  end

  def update
    @feedback = Feedback.find(params[:id])
    @feedback.update_attributes(feedbacks_params)
    redirect_to "/dashboard"
    flash[:success] = "Feedback updated"
  end


  private 
    def feedbacks_params
      #params["request"]["topics"] = params["request"]["topics"].split(",")
      params.require(:feedback).permit(:tutor,:tutoree, :comments, :tutor_comments, :tutoree_comments, :tutor_rating, :tutoree_rating)
    end
end
