class RequestMailer < ApplicationMailer
	def need_help_accepted(user, request)
		@user = user
		@request = request
		receiver = User.find_by_id(@request.user).email
		subj = "Someone is Ready to Tutor You! To confirm and receive the Tutor's contact information please click the link: https://www.google.com"
		mail(to: receiver, subject: subj)
	end

	def giving_help_accepted(user, request)
		@user = user
		@request = request
		receiver = User.find_by_id(@request.user).email
		subj = "Someone would like to be Tutored by You! To confirm and receive the Tutor's contact information please click the link: https://www.google.com"
		mail(to: receiver, subject: subj)
	end
end
