class CreateVtuberCommunities < ActiveRecord::Migration[6.1]
  def change
    create_table :vtuber_communities do |t|
      t.integer :vtuber_information_id, null: false
      t.timestamps
    end
  end
end
