class WelcomeController < ApplicationController
  def index
  end

  def signup
  	@user = User.find_by_id(session[:user_id])
  end
end
