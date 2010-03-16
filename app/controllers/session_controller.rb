class SessionController < ApplicationController
	
	before_filter :authenticate
	
  def index
		redirect_to root_url
  end
  
	private
	
	def authenticate
		authenticate_or_request_with_http_basic do |n, p|
			n == "username" && p == "password" 
			@n, @p = n, p
		end
		if @n == "username" && @p == "password" 
			session[:admin] = true
			redirect_to root_url
		end
	end

end
