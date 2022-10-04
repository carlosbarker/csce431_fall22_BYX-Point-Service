class CreateAttendances < ActiveRecord::Migration[6.1]
  def change
    create_table :attendances do |t|
      t.boolean :tardy

      t.timestamps
    end
    end
end
