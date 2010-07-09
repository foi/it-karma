class PostsController < ApplicationController

	before_filter :check_permission, :only => [ :new, :create, :edit, :delete ] 
 
  def index
		session[:admin] ? @posts = Post.by_date : @posts = Post.published.by_date
		@p = @posts
    #@tags_for_tag_cloud = Post.tag_counts_on(:tags)
		@posts = @posts.paginate :page => params[:page]
	  respond_to do |format|
	  	format.html
			format.rss { render :layout => false }
	  end
  end

  def show
    response.headers['Cache-Control'] = 'public, max-age=300'
    @post = Post.find(params[:id])
		@page_title = @post.title
		@comments = Comment.find(:all, :conditions => ["post_id = ?", params[:id]])
    respond_to do |format|
      format.html
    end
  end

  def new
    @page_title = t :record_create
    @post = Post.new
    respond_to do |format|
      format.html
    end
  end

  def edit
	  @page_title = t :record_modify
    @post = Post.find(params[:id])
    @tags = @post.tag_list
  end

  def create
    @post = Post.new(params[:post])
		@post.astro_data = get_astro
		@post.color = $moon_color
    respond_to do |format|
      if @post.save
        flash[:notice] = t :record_created
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
        flash[:notice] = t :record_modified
        format.html { redirect_to(@post) }
      else
        format.html { render :action => "edit" }
      end
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    flash[:notice] = t :record_deleted
    respond_to do |format|
      format.html { redirect_to(posts_url) }
      format.xml  { head :ok }
    end
  end

	def feed
		@posts = Post.published.limit(5).by_date
		respond_to do |f|
			f.atom
		end
	end

end



