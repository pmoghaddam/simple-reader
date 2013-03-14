class AddStarredToFeedItems < ActiveRecord::Migration
  def change
    add_column :feed_items, :starred, :boolean, :null => false, :default => false
  end
end
