class CreateMembers < ActiveRecord::Migration[6.1]
  def change
    create_table :members do |t|
      t.string :user
      t.string :password
      t.string :f_name
      t.string :l_name

      t.timestamps
    end
  end
end
