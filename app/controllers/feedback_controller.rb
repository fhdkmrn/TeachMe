class FeedbackController < ApplicationController
  def new
    @user = User.find_by_id(session[:user_id])
	@feedback = Feedback.new
  end

  def create
    @feedback = Feedback.new(feedback_params)
    @feedback.save!

  end
  private 
    def feedback_params
      #params["request"]["topics"] = params["request"]["topics"].split(",")
      params.require(:feedback).permit(:tutor,:tutoree)
    end
end
