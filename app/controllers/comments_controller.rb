require 'digest'

class CommentsController < ApplicationController

	before_filter :check_permission, :only => [ :edit, :delete, :update, :show ]

  def index
    @comments = Comment.by_date
    respond_to do |format|
      format.html 
    end
  end

  def show
    @comment = Comment.find(params[:id])
    respond_to do |format|
      format.html
    end
  end

  def new
    @comment = Comment.new
    respond_to do |format|
      format.html
	  format.js { render :layout => false }
    end
  end

  def edit
    @comment = Comment.find(params[:id])
  end

  def create
    @comment = Comment.new(params[:comment])
    respond_to do |format|
      if verify_recaptcha && @comment.save 
        format.html { redirect_to post_path(@comment.post_id) }
      else
	      flash[:error] = "<img src='http://www.picamatic.com/show/2009/07/20/05/40/4505269_18x18.gif'>"
        format.html { redirect_to post_path(@comment.post_id) }
      end
    end
  end

  def update
    @comment = Comment.find(params[:id])
    respond_to do |format|
      if @comment.update_attributes(params[:comment])
        flash[:notice] = 'Comment was successfully updated.'
        format.html { redirect_to comments_path }
      else
        format.html { render :action => "edit" }
      end
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy

    respond_to do |format|
      format.html { redirect_to(comments_url) }
    end
  end

	private

	def check_permission	
		unless session[:admin]
			redirect_to root_url
		end
	end

end
