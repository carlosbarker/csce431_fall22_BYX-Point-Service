class CreateBooks < ActiveRecord::Migration[6.1]
    def change
      create_table :Attendance do |t|
        t.belongs_to :Event, foreign_key: true
        t.belongs_to :Member, foreign_key: true
        t.datetime :arrival_time
      end
    end
  end