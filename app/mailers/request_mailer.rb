class RequestMailer < ApplicationMailer
	def need_help_accepted(user, request)
		@user = user
		@request = request
		receiver = User.find_by_id(@request.user).email
		subj = "Someone is Ready to Tutor You!"
		mail(to: reciever, subject: subj)
	end

	def giving_help_accepted(user, request)
		@user = user
		@request = request
		receiver = User.find_by_id(@request.user).email
		subj = "Someone would like to be Tutored by You!"
		mail(to: reciever, subject: subj)
	end 
end
