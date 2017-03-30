class AddIndexesToForeignKeys < ActiveRecord::Migration
  #add indexes to all foreign keys in all tables
  def change
    add_index :comments, :post_id
    add_index :comments, :user_id

    add_index :posts, :user_id

    add_index :posts_comments, :post_id
    add_index :posts_comments, :comment_id

    add_index :users_posts, :post_id
    add_index :users_posts, :user_id
  end
end
