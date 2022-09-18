class CreateBooks < ActiveRecord::Migration[6.1]
    def change
      create_table :Event do |t|
        t.has_many :Attendance
        t.datetime :datetime
        t.string :title
        t.string :description
        
      end
    end
  end