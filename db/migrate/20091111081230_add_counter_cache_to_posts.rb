class AddCounterCacheToPosts < ActiveRecord::Migration
  def self.up
		add_column :posts, :comments_count, :integer
  end

  def self.down
		remove_column :posts, :comments_count, :integer
  end
end
