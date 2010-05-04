atom_feed do |feed|
	feed.title(h "Всё это вымысел!")
	feed.updated((@posts.first.created_at))
	
	for p in @posts
		feed.entry(p) do |e|
			e.title p.title
			e.content truncate(strip_tags(p.body), :length => 1330) + "#{ link_to ' читать далее', post_path(p)} ", :type => 'html'
			
			e.author do |author|
				author.name("foi")
			end
		end
	end
end