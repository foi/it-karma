class Comment < ActiveRecord::Base
	
	belongs_to :post, :counter_cache => true
	
    named_scope :by_date, lambda { { :order => "created_at DESC" } }

	acts_as_textiled :comment
	
	validates_presence_of :post_id, :name, :comment

end
