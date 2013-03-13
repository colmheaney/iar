class ContactMailer < ActionMailer::Base

	def user_contact(message)
		@message = message
		subject = message.name + " (" + message.email + ")"
		mail(:to => "colm.heaney@btinternet.com", :subject => subject, :body => message.content, :from => "colm.heaney@gmail.com")
	end
end
