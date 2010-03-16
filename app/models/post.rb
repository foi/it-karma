class Post < ActiveRecord::Base
	cattr_reader :per_page
	@@per_page = 10
	
	has_many :comments, :dependent => :destroy
	has_many :taggings, :dependent => :destroy
  has_many :tags, :through => :taggings

	acts_as_taggable_on :tags
	acts_as_textiled :body
	
	validates_presence_of :title, :body, :astro_data
	
	named_scope :published, lambda { { :conditions => ['published = ?', true] } }
	named_scope :by_date, lambda { { :order => "created_at DESC" } }
	named_scope :by_asc_date, lambda { { :order => "created_at ASC" } }
	
  named_scope :by_year, lambda { |year| { :conditions => ['created_at >= ? AND created_at <= ?', year + '-01-01', year + '-12-31'] } }
	named_scope :by_year_month, lambda { |year, month, months| { :conditions => ['created_at >= ? AND created_at <= ?', year + '-' + month + '-01', year + '-' + month + '-' + ( if months.any? { |n| n == month } then '30' elsif month == '02' then '28' else '31' end ) ] } }
	
	def year
		self.created_at.year
	end
	
	def month
		self.created_at.mon 
	end
	
	def day
		self.created_at.day 
	end
	
	def hour
		self.created_at.hour
	end
	
	def min
		self.created_at.min
	end
	
	def sec
		self.created_at.sec
	end
	
end
