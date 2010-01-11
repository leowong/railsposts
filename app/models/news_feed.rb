class NewsFeed < ActiveRecord::Base
  attr_accessible :url

  def self.update
    feed_urls.each do |feed_url|
      update_from_feed(feed_url)
    end
  end

private

  def self.feed_urls
    feeds = all(:select => :url)
    feed_urls = feeds.map { |feed| feed.url.strip }
  end

  def self.update_from_feed(feed_url)
    feed = Feedzirra::Feed.fetch_and_parse(feed_url)
    unless feed == 0
      add_entries(feed.entries)
    end
  end
  
  def self.add_entries(entries)
    entries.each do |entry|
      unless Post.exists? :guid => entry.id
        Post.create!(
          :title        => entry.title,
          :summary      => entry.summary,
          :url          => entry.url,
          :published_at => entry.published,
          :guid         => entry.id
        )
      end
    end
  end
end
