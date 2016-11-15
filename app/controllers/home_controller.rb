class HomeController < ApplicationController
  def show
	@user = User.find_by_id(session[:user_id])
	if @user != nil
		if @user.year == nil
			redirect_to '/signup'
		end
	end

  end
end
