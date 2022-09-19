class CreateEvents < ActiveRecord::Migration[6.1]
  def change
    create_table :events do |t|
      t.datetime :datetime
      t.string :title
      t.string :description

      t.timestamps
    end
  end
end
