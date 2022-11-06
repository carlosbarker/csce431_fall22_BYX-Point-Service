class CreateRelations < ActiveRecord::Migration[6.1]
  def change
    add_reference :attendances, :members, foreign_key: true
    add_reference :attendances, :meetings, foreign_key: true
    add_reference :service_points, :members, foreign_key: true
    add_reference :service_points, :events, foreign_key: true
    add_index :members, :email, unique: true
    add_foreign_key :users, :members, column: :email, primary_key: :email

    end
end
