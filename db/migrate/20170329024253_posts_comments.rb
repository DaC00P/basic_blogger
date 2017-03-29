class PostsComments < ActiveRecord::Migration
  def change
    create_table :posts_comments do |t|
      t.integer :post_id, null: false
      t.integer :comment_id, null: false
      t.timestamps null: false
    end
  end
end
