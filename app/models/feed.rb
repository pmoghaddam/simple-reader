class Feed < ActiveRecord::Base
  belongs_to :user
  has_many :feed_items, :dependent => :destroy

  attr_accessible :title, :url, :feed_url, :user
end
