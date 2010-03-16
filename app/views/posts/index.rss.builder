xml.instruct! :xml, :version => "1.0"
xml.rss :version => "2.0" do
	xml.channel do
		xml.title "Всё это вымысел!"
		xml.description "астрология, нумерология, карма, сновидения, архетипы, психология, философия, коллективное сознание, религия... и т.д."
		xml.link formatted_posts_url(:rss)
		
		for post in @posts
			xml.item do
				xml.title post.title
				xml.description post.body
				xml.pubDate post.created_at.to_s(:rfc822)
				xml.link post_url(post)
			end
		end
	end
end
