# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
	
	def admin?
		session[:admin] == true ? true : false
	end

end
