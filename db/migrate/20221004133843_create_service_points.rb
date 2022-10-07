class CreateServicePoints < ActiveRecord::Migration[6.1]
  def change
    create_table :service_points do |t|
      t.datetime :datetime

      t.timestamps
    end
  end
end
