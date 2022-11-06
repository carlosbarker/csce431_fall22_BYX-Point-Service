class CreateMembers < ActiveRecord::Migration[6.1]
  def change
    create_table :members do |t|
      ## Personal info
      t.string :email, null: false, default: ""
      t.string :full_name
      t.string :uid
      t.string :card_id
      t.string :phone
      t.boolean :graduated

      t.timestamps
    end
  end
end
