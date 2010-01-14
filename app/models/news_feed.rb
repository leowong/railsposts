class NewsFeed < ActiveRecord::Base
  has_many :posts

  validates_presence_of :url, :homepage, :source

  attr_accessible :url, :homepage, :source

  def self.update
    feeds.each do |feed|
      update_from_feed(feed.url.strip, feed.id)
    end
  end

private

  def self.feeds
    feeds = all
  end

  def self.update_from_feed(feed_url, feed_id)
    feed = Feedzirra::Feed.fetch_and_parse(feed_url)
    unless feed == 0
      add_entries(feed.entries, feed_id)
    end
  end
  
  def self.add_entries(entries, feed_id)
    entries.each do |entry|
      unless Post.exists? :guid => entry.id
        Post.create!(
          :title        => entry.title,
          :summary      => entry.summary,
          :url          => entry.url,
          :published_at => entry.published,
          :guid         => entry.id,
          :news_feed_id => feed_id
        )
      end
    end
  end
end
