class RenameUserToOwner < ActiveRecord::Migration[5.0]
  def change
    rename_column :lists, :user_id, :owner_id
  end
end
