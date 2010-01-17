class AddPointsToPost < ActiveRecord::Migration
  def self.up
    add_column :posts, :points, :integer, :default => 0, :null => false
  end

  def self.down
    remove_column :posts, :points
  end
end
