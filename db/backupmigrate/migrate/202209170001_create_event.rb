class CreateEvent < ActiveRecord::Migration[6.1]
    def change
      create_table :Event do |t|

        t.datetime :datetime
        t.string :title
        t.string :description
        
      end
    end
  end


@attendance = Attendance.create(
    {arrival_time: '9/26/2022'})

@attendance.Member.create({
    f_user: 'test', 
    password: 'pass', 
    f_name: 'John',
    l_name: 'Doe'})

@attendance.Event.create({
    datetime: '9/25/2022', 
    title: 'party', 
    description: 'Crazy but not too crazy'})