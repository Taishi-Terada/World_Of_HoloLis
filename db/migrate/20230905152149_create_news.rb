class CreateNews < ActiveRecord::Migration[6.1]
  def change
    create_table :news do |t|
      t.string :news_name, null: false
      t.text :news_introduction, null: false
      t.timestamps
    end
  end
end
