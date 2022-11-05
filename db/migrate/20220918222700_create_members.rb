class CreateMembers < ActiveRecord::Migration[6.1]
  def change
    create_table :members do |t|
      t.string :card_id
      t.string :phone
      t.boolean :admin
      t.boolean :graduated

      t.timestamps
    end
  end
end
