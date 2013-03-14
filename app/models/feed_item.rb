class FeedItem < ActiveRecord::Base
  belongs_to :feed

  attr_accessible :author, :read, :summary, :content, :title, :url, :published_date, :feed

  default_scope -> { order("published_date DESC") }
end
