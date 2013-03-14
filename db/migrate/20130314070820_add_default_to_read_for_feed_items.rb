class AddDefaultToReadForFeedItems < ActiveRecord::Migration
  def change
    change_column :feed_items, :read, :boolean, :null => false, :default => false
  end
end
