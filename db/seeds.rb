# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require "time"
require "csv"


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

# create an array of rows for the existing csv data files
fall2021_data = CSV.read(Rails.root.join('lib', 'seeds', 'fall2021.csv'))
spring2022_data = CSV.read(Rails.root.join('lib', 'seeds', 'spring2022.csv'))
fall2022_data = CSV.read(Rails.root.join('lib', 'seeds', 'fall2022.csv'))



# parse the attendence data
def parse_attendence_data(arr, year)
    months = ['JAN', 'FEB', 'MAR', 'APR', 'MAY', 'JUN', 'JUL', 'AUG', 'SEP', 'OCT', 'NOV', 'DEC']
    headers = arr[0]
    headers.each do |header|
      # if the header ends with a month name
      if months.include? header[-3..-1].upcase
        #puts 'adding: ' + header
        date = Time.parse(year + '-' + header[-3..-1] + '-' + header[0..-4])
        Meeting.create({datetime: date})
      end
    end
end

parse_attendence_data(fall2021_data, '2021')

