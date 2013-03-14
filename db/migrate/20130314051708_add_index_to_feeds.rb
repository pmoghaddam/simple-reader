class AddIndexToFeeds < ActiveRecord::Migration
  def change
    add_index :feeds, [:user_id, :feed_url], :unique => true
  end
end
