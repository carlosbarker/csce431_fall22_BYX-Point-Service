class CreateMember < ActiveRecord::Migration[6.1]
    def change
      create_table :Member do |t|

        t.string :username
        t.string :password
        t.string :f_name
        t.string :l_name

      end
    end
  end