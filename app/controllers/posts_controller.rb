class PostsController < ApplicationController

	before_filter :check_permission, :only => [ :new, :create, :edit, :delete ] 
 
  def index
		session[:admin] ? @posts = Post.by_date : @posts = Post.published.by_date
		@p = @posts
		@posts = @posts.paginate :page => params[:page]
	  respond_to do |format|
	  	format.html
			format.rss { render :layout => false }
	  end
  end

  def show
    @post = Post.find(params[:id])
		@page_title = @post.title
		@comments = Comment.find(:all, :conditions => ["post_id = ?", params[:id]])
    respond_to do |format|
      format.html
    end
  end

  def new
    @post = Post.new
    respond_to do |format|
      format.html
    end
  end

  def edit
	  @page_title = 'изменить'
    @post = Post.find(params[:id])
    @tags = @post.tag_list
  end

  def create
	  @page_title = "написать"
    @post = Post.new(params[:post])
		@post.astro_data = get_astro
		@post.color = $moon_color
    respond_to do |format|
      if @post.save
        flash[:notice] = 'Запись успешно запощена'
        format.html { redirect_to(@post) }
      else
        format.html { render :action => "new" }
      end
    end
  end

  def update
    @post = Post.find(params[:id])
    respond_to do |format|
      if @post.update_attributes(params[:post])
        flash[:notice] = 'Запись успешно изменена'
        format.html { redirect_to(@post) }
      else
        format.html { render :action => "edit" }
      end
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy

    respond_to do |format|
      format.html { redirect_to(posts_url) }
      format.xml  { head :ok }
    end
  end

	def feed
		@posts = Post.published.limit(5).by_date
		respond_to	do |f|
			f.atom
		end
	end

  private

	def check_permission	
		unless session[:admin]
			redirect_to root_url
		end
	end
	
end



