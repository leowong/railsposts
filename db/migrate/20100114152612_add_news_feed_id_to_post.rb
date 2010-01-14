class AddNewsFeedIdToPost < ActiveRecord::Migration
  def self.up
    remove_column :posts, :source
    add_column :posts, :news_feed_id, :integer, :default => 0, :null => false
  end

  def self.down
    remove_column :posts, :news_feed_id
    add_column :posts, :source, :string
  end
end
