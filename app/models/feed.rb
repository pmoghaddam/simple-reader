class Feed < ActiveRecord::Base
  belongs_to :user
  has_many :feed_items

  attr_accessible :title, :url
end
