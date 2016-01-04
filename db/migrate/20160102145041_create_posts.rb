class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :title
      t.string :link_url
      t.string :image_url
      t.text :body
      t.integer :user_id
      t.integer :category_id

      t.timestamps null: false
    end
  end
end
