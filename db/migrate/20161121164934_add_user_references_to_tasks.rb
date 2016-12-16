class AddUserReferencesToTasks < ActiveRecord::Migration[5.0]
  def change
    add_reference :tasks, :user
  end
end
