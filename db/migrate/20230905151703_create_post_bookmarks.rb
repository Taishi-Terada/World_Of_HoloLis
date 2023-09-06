class CreatePostBookmarks < ActiveRecord::Migration[6.1]
  def change
    create_table :post_bookmarks do |t|
      t.integer :customer_id, null: false
      t.integer :post_id, null: false
      t.timestamps
    end
  end
end
