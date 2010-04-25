atom_feed do |feed|
	feed.title(h "Всё это вымысел!")
	feed.updated((@posts.first.created_at))
	
	for p in @posts
		feed.entry(p) do |e|
			e.title p.title
			e.content p.body, :type => 'html'
			
			e.author do |author|
				author.name("foi")
			end
		end
	end
end