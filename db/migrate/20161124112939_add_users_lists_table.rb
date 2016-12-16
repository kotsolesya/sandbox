class AddUsersListsTable < ActiveRecord::Migration[5.0]
  def change
    create_join_table :lists, :users
  end
end
