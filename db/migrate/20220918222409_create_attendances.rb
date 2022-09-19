class CreateAttendances < ActiveRecord::Migration[6.1]
  def change
    create_table :attendances do |t|
      t.datetime :arrival_time

      t.timestamps
    end
    #add_reference :attendances, :members, foreign_key: true
    #add_reference  :members, :attendances, foreign_key: true
    #add_reference :attendances, :events, foreign_key: true
    #add_reference  :events, :attendances, foreign_key: true
    end
end
