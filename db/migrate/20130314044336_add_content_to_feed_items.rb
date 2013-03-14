class AddContentToFeedItems < ActiveRecord::Migration
  def change
    add_column :feed_items, :content, :text
  end
end
