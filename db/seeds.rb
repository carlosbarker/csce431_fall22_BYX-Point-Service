# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require "time"


ServicePoint.destroy_all
Attendance.destroy_all

Event.destroy_all
Meeting.destroy_all

Member.destroy_all

@test_memb = Member.create({
    username: 'test', 
    password: 'pass', 
    f_name: 'John',
    l_name: 'Doe',
    card_id: '%777777',
    email: 'john.doe@gmail.com',
    phone: '6977664062',
    admin: false,
    graduated: true})

@test_event = Event.create({
    datetime: Time.parse("Sep 19 2020 10:00"), 
    title: 'party', 
    description: 'Crazy but not too crazy'})

@test_servicepoint = ServicePoint.create({
    datetime: Time.parse("Sep 20 2020 12:10"),
    members_id: @test_memb.id,
    events_id: @test_event.id})

@test_meeting = Meeting.create({
    datetime: Time.parse("Sep 20 2020 12:00") })

@test_att = Attendance.create({
    tardy: false,
    members_id: @test_memb.id,
    meetings_id: @test_meeting.id})

