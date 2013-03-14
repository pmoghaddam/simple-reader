class RemoveSourceFromFeedItems < ActiveRecord::Migration
  def up
    remove_column :feed_items, :source
  end

  def down
    add_column :feed_items, :source, :string
  end
end
