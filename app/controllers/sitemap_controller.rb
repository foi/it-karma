class SitemapController < ApplicationController
  layout nil

  def index
    @posts = Post.published.limit(4997).by_date
    respond_to do |format|
      format.xml
     end
  end

end
