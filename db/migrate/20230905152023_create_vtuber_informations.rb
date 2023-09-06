class CreateVtuberInformations < ActiveRecord::Migration[6.1]
  def change
    create_table :vtuber_informations do |t|
      t.string :vtuber_name, null: false
      t.string :youtube_name, null: false
      t.string :twitter_name, null: false
      t.string :tag_name, null: false
      t.string :fan_name, null: false
      t.string :mark, null: false
      t.string :color, null: false
      t.string :height, null: false
      t.string :blood_type, null: false
      t.datetime :birthday, null: false
      t.datetime :first_delivery, null: false
      t.timestamps
    end
  end
end
