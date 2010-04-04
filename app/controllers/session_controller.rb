class SessionController < ApplicationController
	
	before_filter :authenticate
	
  def index
		redirect_to root_url
  end
  
	private
	
	def authenticate
		authenticate_or_request_with_http_basic do |n, p|
			n == "u" && p == "p" 
			@n, @p = n, p
		end
		if @n == "u" && @p == "p" 
			session[:admin] = true
			redirect_to root_url
		end
	end

end
