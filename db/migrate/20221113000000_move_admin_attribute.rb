class MoveAdminAttribute < ActiveRecord::Migration[6.1]
  def change
    remove_column :users, :admin
    add_column :members, :admin, :boolean
    end
end
