class AddHomepageToNewsFeed < ActiveRecord::Migration
  def self.up
    add_column :news_feeds, :homepage, :string
  end

  def self.down
    remove_column :news_feeds, :homepage
  end
end
