class NewsFeed < ActiveRecord::Base
  validates_presence_of :url, :source

  attr_accessible :url, :source

  def self.update
    feeds.each do |feed|
      update_from_feed(feed.url.strip, feed.source.strip)
    end
  end

private

  def self.feeds
    feeds = all(:select => "url, source")
  end

  def self.update_from_feed(feed_url, feed_source)
    feed = Feedzirra::Feed.fetch_and_parse(feed_url)
    unless feed == 0
      add_entries(feed.entries, feed_source)
    end
  end
  
  def self.add_entries(entries, feed_source)
    entries.each do |entry|
      unless Post.exists? :guid => entry.id
        Post.create!(
          :title        => entry.title,
          :summary      => entry.summary,
          :url          => entry.url,
          :published_at => entry.published,
          :guid         => entry.id,
          :source       => feed_source
        )
      end
    end
  end
end
