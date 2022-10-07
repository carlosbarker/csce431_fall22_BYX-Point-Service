class CreateMembers < ActiveRecord::Migration[6.1]
  def change
    create_table :members do |t|
      t.string :username
      t.string :password
      t.string :f_name
      t.string :l_name
      t.string :card_id
      t.string :email
      t.string :phone
      t.boolean :admin
      t.boolean :graduated

      t.timestamps
    end
  end
end
