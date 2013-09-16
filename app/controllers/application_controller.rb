class ApplicationController < ActionController::Base
  protect_from_forgery
  include SessionsHelper

	def common_content
		@message = Message.new
	end	
end
