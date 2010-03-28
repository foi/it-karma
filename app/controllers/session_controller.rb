class SessionController < ApplicationController
	
	before_filter :authenticate
	
  def index
		redirect_to root_url
  end
  
	private
	
	def authenticate
		authenticate_or_request_with_http_basic do |n, p|
			n == "user" && p == "pass" 
			@n, @p = n, p
		end
		if @n == "user" && @p == "pass" 
			session[:admin] = true
			redirect_to root_url
		end
	end

end
