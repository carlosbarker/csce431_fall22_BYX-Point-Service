class CreateMembers < ActiveRecord::Migration[6.1]
  def change
    create_table :members do |t|
      ## Personal info
      t.string :full_name
      t.string :uid
      t.string :card_id
      t.string :phone
      t.boolean :graduated
      t.boolean :admin

      ## Database authenticatable
      t.string :email, null: false, default: ""
      t.string :encrypted_password, null: false, default: ""

      ## Recoverable
      t.string :reset_password_token
      t.datetime :reset_password_sent_at

      ## Rememberable
      t.datetime :remember_created_at

      ## Trackable
      t.integer :sign_in_count, default: 0, null: false
      t.datetime :current_sign_in_at
      t.datetime :last_sign_in_at
      t.string :current_sign_in_ip
      t.string :last_sign_in_ip
      
      ## Google stuff
      t.string :avatar_url
      t.string :provider

      t.timestamps
    end
  end
end
