class CreateAttendance < ActiveRecord::Migration[6.1]
    def change
      create_table :Attendance do |t|
        t.datetime :arrival_time
      end
      add_reference :Attendance, :Member, foreign_key: true
      add_reference  :Member, :Attendance, foreign_key: true
      add_reference :Attendance, :Event, foreign_key: true
      add_reference  :Event, :Attendance, foreign_key: true
    end
  end