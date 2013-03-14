class AddPublishedDateToFeedItems < ActiveRecord::Migration
  def change
    add_column :feed_items, :published_date, :datetime
  end
end
