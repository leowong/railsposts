class AddSourceToNewsFeed < ActiveRecord::Migration
  def self.up
    add_column :news_feeds, :source, :string
  end

  def self.down
    remove_column :news_feeds, :source
  end
end
