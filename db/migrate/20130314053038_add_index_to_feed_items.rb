class AddIndexToFeedItems < ActiveRecord::Migration
  def change
    add_index :feed_items, [:feed_id, :url], :unique => true
  end
end
