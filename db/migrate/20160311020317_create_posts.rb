class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :post_text
      t.integer :user_id
      t.string :photo_id

      t.timestamps null: false
    end
  end
end
