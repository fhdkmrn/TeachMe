require "shorturl"

class RequestMailer < ApplicationMailer
	def need_help_accepted(user, request)
		@user = user
		@request = request
		url = "http://cal-teachme.herokuapp.com/request/confirm/" + @request.id.to_s +"/" + @user.id.to_s
    @confirmURL = ShortURL.shorten(url, :tinyurl)
		receiver = User.find_by_id(@request.user).email
		subj = "Someone is Ready to Tutor You!"
		mail(to: receiver, subject: subj)
	end

	def giving_help_accepted(user, request)
		@user = user
		@request = request
		url = "http://cal-teachme.herokuapp.com/request/confirm/" + @request.id.to_s + "/" + @user.id.to_s
    @confirmURL = ShortURL.shorten(url, :tinyurl)
		receiver = User.find_by_id(@request.user).email
		subj = "Someone would like to be Tutored by You!"
		mail(to: receiver, subject: subj)
	end
end
