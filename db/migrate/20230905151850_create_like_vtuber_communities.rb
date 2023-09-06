class CreateLikeVtuberCommunities < ActiveRecord::Migration[6.1]
  def change
    create_table :like_vtuber_communities do |t|
      t.integer :customer_id, null: false
      t.integer :vtuber_community_id, null: false
      t.timestamps
    end
  end
end
