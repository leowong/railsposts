class Post < ActiveRecord::Base
  belongs_to :news_feed

  attr_accessible :title, :summary, :url, :published_at, :guid, :source, :news_feed_id
  cattr_reader :per_page
  @@per_page = 50

  def self.search(search, page)
    conditions = ["news_feeds.source == ?",  search] if search
    paginate :page => page,
             :joins => :news_feed,
             :select => "posts.*, news_feeds.source as source",
             :conditions => conditions,
             :order => "published_at DESC"
  end
end
