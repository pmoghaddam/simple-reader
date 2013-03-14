class FeedService

  def add(url, user)
    raw_feed = Feedzirra::Feed.fetch_and_parse(url)
    feed = Feed.where(user_id: user.id, feed_url: raw_feed.feed_url).first
    unless feed
      feed = Feed.create(user: user, title: raw_feed.title, url: raw_feed.url, feed_url: raw_feed.feed_url)
    end
    feed
  end

  def fetch(feed)
    raw_feed = Feedzirra::Feed.fetch_and_parse(feed.feed_url)
    raw_feed.entries.each do |entry|
      entry.sanitize!
      begin
        FeedItem.create(feed: feed,
                        title: entry.title,
                        author: entry.author,
                        summary: entry.summary,
                        content: entry.content,
                        url: entry.url,
                        published_date: entry.published)
      rescue Exception
        # Do nothing
      end
    end
  end

  def add_and_fetch(url, user)
    feed = add(url, user)
    fetch(feed)
    feed
  end

  def refresh(user)
    user.feeds.each { |feed| fetch(feed) }
  end

end