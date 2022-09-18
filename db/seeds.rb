# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

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