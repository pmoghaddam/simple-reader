class AddFeedUrlFeeds < ActiveRecord::Migration
  def change
    add_column :feeds, :feed_url, :string
  end
end
