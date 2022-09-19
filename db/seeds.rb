# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require "time"

Attendance.destroy_all
Member.destroy_all
Event.destroy_all



@test_memb = Member.create({
    user: 'test', 
    password: 'pass', 
    f_name: 'John',
    l_name: 'Doe'})

@test_event = Event.create({
    datetime: Time.parse("Sep 19 2020 10:00"), 
    title: 'party', 
    description: 'Crazy but not too crazy'})

@test_att = Attendance.create!({
    arrival_time: Time.parse("Sep 19 2020 10:10"),
    members_id: @test_memb.id,
    events_id: @test_event.id})