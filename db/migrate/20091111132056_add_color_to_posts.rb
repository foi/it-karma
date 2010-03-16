class AddColorToPosts < ActiveRecord::Migration
  def self.up
		add_column :posts, :color, :string, :default => '#D3FFF7'
  end

  def self.down
		remove_column :posts, :color
  end
end
