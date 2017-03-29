class AddUsernameToUserAndRemoveFromComments < ActiveRecord::Migration
  def change
    add_column :users, :user_chosen_name, :string, null: false
    remove_column :comments, :user_chosen_name
  end
end
