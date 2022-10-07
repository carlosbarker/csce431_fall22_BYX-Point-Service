class CreateRelations < ActiveRecord::Migration[6.1]
  def change
    add_reference :attendances, :members, foreign_key: true
    add_reference :attendances, :meetings, foreign_key: true
    add_reference :service_points, :members, foreign_key: true
    add_reference :service_points, :events, foreign_key: true
    end
end
