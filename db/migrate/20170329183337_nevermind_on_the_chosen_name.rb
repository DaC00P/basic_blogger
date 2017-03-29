class NevermindOnTheChosenName < ActiveRecord::Migration
  def change
    remove_column :users, :user_chosen_name
  end
end
