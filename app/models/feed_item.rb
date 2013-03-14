class FeedItem < ActiveRecord::Base
  belongs_to :feed

  attr_accessible :author, :read, :summary, :title, :url
end
