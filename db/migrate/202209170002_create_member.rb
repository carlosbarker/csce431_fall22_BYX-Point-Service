class CreateBooks < ActiveRecord::Migration[6.1]
    def change
      create_table :Member do |t|
        t.has_many :Attendance
        t.string :username
        t.string :password
        t.string :f_name
        t.string :l_name
      end
    end
  end