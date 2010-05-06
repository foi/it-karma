xml.instruct! :xml, :version => "1.0", :encoding=>"UTF-8"
xml.urlset(:xmlns => "http://www.sitemaps.org/schemas/sitemap/0.9") do
CUSTOM_URLS.each do |url|
	xml.url do
		xml.loc(self.request.protocol + self.request.domain + url) 
		xml.lastmod(Time.now.strftime("%Y-%m-%d"))
		xml.changefreq("always")
		xml.priority(1)
	end
end
@posts.each do |post|
		xml.url do
			xml.loc(url_for :controller => 'posts', :action => 'show', :id => post.id, :only_path => false)
			xml.lastmod(post.updated_at.strftime("%Y-%m-%d"))
			xml.changefreq("daily")
			xml.priority(1)
		end
	end
end