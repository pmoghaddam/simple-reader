class RemoveUserIdFromFeedItems < ActiveRecord::Migration
  def up
    remove_column :feed_items, :user_id
  end

  def down
    add_column :feed_items, :user_id, :integer
  end
end
