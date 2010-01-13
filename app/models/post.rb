class Post < ActiveRecord::Base
  attr_accessible :title, :summary, :url, :published_at, :guid, :source
  cattr_reader :per_page
  @@per_page = 50
end
