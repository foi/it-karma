RAILS_GEM_VERSION = '2.3.11' unless defined? RAILS_GEM_VERSION

ENV['RECAPTCHA_PUBLIC_KEY']  = '6Lc9fwkAAAAAAEPmaGhIFx3CcNgmMg9m_UDj8fVO'
ENV['RECAPTCHA_PRIVATE_KEY'] = '6Lc9fwkAAAAAAGILDTn9uqw4brwDBzEpkuSwPMGH'
AUTHOR = 'foi'
#UNIQUE URLS FOR SITEMAP 
CUSTOM_URLS = ['/', '/o_O']

require File.join(File.dirname(__FILE__), 'boot')

Rails::Initializer.run do |config|
	config.gem "acts-as-taggable-on", :source => "http://rubygems.org"
	config.gem "nokogiri"
	config.gem "RedCloth", :lib => "redcloth"
	config.gem "will_paginate"
	config.gem "russian"
	config.gem "hpricot"
	config.gem "htmlentities"
	#config.action_controller.session_store = :active_record_store
	config.time_zone = 'UTC'
end




