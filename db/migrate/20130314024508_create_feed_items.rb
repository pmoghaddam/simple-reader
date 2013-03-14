class CreateFeedItems < ActiveRecord::Migration
  def change
    create_table :feed_items do |t|
      t.integer :user_id
      t.string :title
      t.string :author
      t.string :source
      t.text :summary
      t.string :url
      t.boolean :read

      t.timestamps
    end
  end
end
