require "shorturl"

class RequestMailer < ApplicationMailer

	def send_contact_info(user1, user2, request)
		@user1 = user1
		@user2 = user2
		@request = request
		receiver = @user2.email
		subj = "Contact Information for: #{user1.name}"
		mail(to: receiver, subject: subj)
	end

	def need_help_accepted(user, request)
		@user = user
		@request = request
		url = "http://cal-teachme.herokuapp.com/request/confirm/#{@request.id}/#{@user.id}"
    @confirmURL = ShortURL.shorten(url, :tinyurl)
		receiver = User.find_by_id(@request.user).email
		subj = "Someone is Ready to Tutor You!"
		mail(to: receiver, subject: subj)
	end

	def giving_help_accepted(user, request)
		@user = user
		@request = request
		url = "http://cal-teachme.herokuapp.com/request/confirm/#{@request.id}/#{@user.id}"
    @confirmURL = ShortURL.shorten(url, :tinyurl)
		receiver = User.find_by_id(@request.user).email
		subj = "Someone would like to be Tutored by You!"
		mail(to: receiver, subject: subj)
	end
end
