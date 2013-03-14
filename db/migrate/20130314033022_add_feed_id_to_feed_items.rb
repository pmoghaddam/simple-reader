class AddFeedIdToFeedItems < ActiveRecord::Migration
  def change
    add_column :feed_items, :feed_id, :integer

    add_index :feed_items, :feed_id
  end
end
