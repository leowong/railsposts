class Post < ActiveRecord::Base
  belongs_to :news_feed
  attr_accessible :title, :summary, :content, :url, :published_at, :guid, :source, :news_feed_id, :weight
  cattr_reader :per_page
  @@per_page = 50

  named_scope :hot,
              :joins => :news_feed,
              :select => "posts.*, news_feeds.source as source", :conditions => ['weight >= ?', 0],
              :order => "weight DESC, published_at DESC"

  def self.search(search, page)
    conditions = ["news_feeds.source = ?",  search] if search
    paginate :page => page,
             :joins => :news_feed,
             :select => "posts.*, news_feeds.source as source",
             :conditions => conditions,
             :order => "published_at DESC"
  end

  def self.update_weight
    Post.all.each do |post|
      weight = ((post.points - 1) * 1024) / ((((Time.now - post.published_at)/3600) + 2) ** 1.5)
      Post.update post.id, { :weight => weight }
    end
  end

  def increase_points_by_one
    self.update_attribute(:points, points.to_i + 1)
  end
end
