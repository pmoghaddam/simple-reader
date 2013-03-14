class FeedQuery
  def initialize(user)
    @user = user
  end

  def feed_items
    FeedItem.joins(:feed).where('feeds.user_id' => @user.id)
  end
end