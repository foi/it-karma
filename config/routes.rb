ActionController::Routing::Routes.draw do |map|
  map.resources :posts, :comments

  map.root :controller => "posts", :action => "index"
	map.tag '/tag/:id', :controller => 'tags', :action => 'show'
	
	map.posts_with_pages 'posts/page/:page', :controller => 'posts', :action => 'index'

	map.o 'o_O', :controller => 'find', :action => 'o'
	
	map.posts_year_month 'p/:year/:month', :controller => 'find', :action => 'year_month'
	map.posts_year 'p/:year', :controller => 'find', :action => 'year'
	
	map.feed 'feed', :controller => 'posts', :action => 'feed'
	map.sitemap '/sitemap.xml', :controller => 'sitemap'
	
  map.connect ':controller/:action/:id'
  map.connect ':controller/:action/:id.:format'
end
