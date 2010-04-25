ENV['RECAPTCHA_PUBLIC_KEY']  = '6Lc9fwkAAAAAAEPmaGhIFx3CcNgmMg9m_UDj8fVO'
ENV['RECAPTCHA_PRIVATE_KEY'] = '6Lc9fwkAAAAAAGILDTn9uqw4brwDBzEpkuSwPMGH'

require File.join(File.dirname(__FILE__), 'boot')

Rails::Initializer.run do |config|
	#config.gem "racc", :source => "http://gems.rubyforge.org"
	config.gem "rexical", :source => "http://rubygems.org"
	#config.gem "rake-compiler", :source => "http://rubygems.org"
	config.gem "acts-as-taggable-on", :source => "http://rubygems.org"
	config.gem "nokogiri", :source => "http://gems.rubyforge.org"
	config.gem "RedCloth", :lib => 'redcloth'
	config.gem 'will_paginate', :source => 'http://gems.github.com'
	config.action_controller.session_store = :active_record_store
	config.time_zone = 'UTC'
	
end




