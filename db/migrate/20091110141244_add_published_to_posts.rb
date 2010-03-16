class AddPublishedToPosts < ActiveRecord::Migration
  def self.up
		change_table :posts do |t|
			t.boolean :published, :default => false
		end
  end

  def self.down
		remove_column :posts, :published
  end
end
