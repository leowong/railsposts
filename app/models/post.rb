class Post < ActiveRecord::Base
  attr_accessible :title, :summary, :url, :published_at, :guid, :source
end
