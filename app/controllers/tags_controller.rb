class TagsController < ApplicationController
	
	def show
		@page_title = "записи с тегом #{ params[:id] }"
		session[:admin] ? @posts = Post.tagged_with(params[:id]).by_date : @posts = Post.published.tagged_with(params[:id]).by_date
	end
	
end