class AddCommenterName < ActiveRecord::Migration
  def change
    add_column :comments, :user_chosen_name, :string, null: false
  end
end
