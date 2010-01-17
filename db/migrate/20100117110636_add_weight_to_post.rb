class AddWeightToPost < ActiveRecord::Migration
  def self.up
    add_column :posts, :weight, :float, :default => 0.0, :null => false
  end

  def self.down
    remove_column :posts, :weight
  end
end
