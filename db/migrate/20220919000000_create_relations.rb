class CreateRelations < ActiveRecord::Migration[6.1]
  def change
    add_reference :attendances, :members, foreign_key: true
    #add_reference  :members, :attendances, foreign_key: true
    add_reference :attendances, :events, foreign_key: true
    #add_reference  :events, :attendances, foreign_key: true
    end
end
