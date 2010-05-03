require 'digest'

class CommentsController < ApplicationController

	before_filter :check_permission, :only => [ :edit, :delete, :update, :index ]

  def index
    @page_title = t :comments_index
    @comments = Comment.by_date
    respond_to do |format|
      format.html 
    end
  end

  def edit
    @page_title = t :comment_modify
    @comment = Comment.find(params[:id])
  end

  def create
    @comment = Comment.new(params[:comment])
    respond_to do |format|
      if verify_recaptcha && @comment.save 
        flash[:notice] = t :comment_created
        format.html { redirect_to post_path(@comment.post_id) }
      else
        flash[:notice] = t :comment_error
        format.html { redirect_to post_path(@comment.post_id) }
      end
    end
  end

  def update
    @comment = Comment.find(params[:id])
    respond_to do |format|
      if @comment.update_attributes(params[:comment])
        flash[:notice] = t :comment_modifed
        format.html { redirect_to comments_path }
      else
        format.html { render :action => "edit" }
      end
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    flash[:notice] = t :comment_deleted
    respond_to do |format|
      format.html { redirect_to(comments_url) }
    end
  end

end
