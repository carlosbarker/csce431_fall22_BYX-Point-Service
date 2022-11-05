class CreateMembers < ActiveRecord::Migration[6.1]
  def change
    create_table :members do |t|
      t.string :full_name
      t.string :uid
      t.string :card_id
      t.string :email, null: false, default: ""
      t.string :phone
      t.boolean :admin
      t.boolean :graduated
      t.string :avatar_url
      t.string :provider
      t.string :encrypted_password, null: false, default: ""

      t.timestamps
    end
  end
end
