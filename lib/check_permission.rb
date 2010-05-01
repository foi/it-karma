def check_permission	
	unless session[:admin]
		redirect_to root_url
	end
end