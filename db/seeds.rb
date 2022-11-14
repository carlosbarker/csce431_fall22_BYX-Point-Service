# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'time'
require 'csv'


# parse the attendence data and fills database with meetings
# returns array of indexes that have created a unique meeting
def parse_meetings(arr, year)
    months = ['JAN', 'FEB', 'MAR', 'APR', 'MAY', 'JUN', 'JUL', 'AUG', 'SEP', 'OCT', 'NOV', 'DEC']
    headers = arr[0]
    meeting_cols = []
    meetings = []
    for i in 0..headers.size()-1
        header = headers[i]
        next if header.nil? # skip if the header is empty
        next if header.size() <= 4 # skip if the header is not long enough to be a meeting header

        # if the header ends with a month name
        if months.include? header[-3..-1].upcase
            date = Time.parse(year + '-' + header[-3..-1] + '-' + header[0..-4])
            meetings.append(Meeting.create({datetime: date}))
            meeting_cols.append(i)
        end
    end
    return meeting_cols, meetings
  end

# parse all data, adds unique members, attendance, and meetings to the database
def parse_data(arrs, years)
    meeting_indexes = [] # col index for meeting in a csv
    all_meetings = [] # holds meeting model data
    members_hash = Hash.new # members hash, will be filled with (key:[card_id, name]) and (value: Member object) pairs.

    # iterate through the csvs, create meetings and members
    for i in 0..arrs.size()-1
        # add meetings to database and get indexes of each meeting in each csv
        indexes, meetings = parse_meetings(arrs[i], years[i])
        meeting_indexes.append(indexes)
        all_meetings.append(meetings)
        for j in 1..arrs[i].size()-1

        if members_hash.include?([arrs[i][j][0], arrs[i][j][1]]) # if member has already been added/created
            next
            
        else # if member has not been added/created
            next if arrs[i][j][1].nil? # if there is no name, then skip making a member
            tokens = arrs[i][j][1].split(' ')
            fname = tokens[0]
            lname = tokens[1]
            member = Member.create({
                f_name: fname,
                l_name: lname,
                card_id: arrs[i][j][0]
            })

            members_hash[[arrs[i][j][0], arrs[i][j][1]]] = member
        end
        # add member to unique member set
        
        end
    end

    # create attendance instances
    for i in 0..arrs.size()-1 # for each csv file provided
        arr = arrs[i]
        for j in 0..all_meetings[i].size()-1 # for each meeting in that csv file
            meeting = all_meetings[i][j]
            col = meeting_indexes[i][j]
            for k in 1..arr.size()-1 # for each row in the csv file
                next if arr[k][1].nil? # skip if there is no name
                next if !members_hash.include?([arr[k][0], arr[k][1]]) # skip if hashmap doesnt have key: [card_id, name]

                attendance_val = arr[k][col]
                
                next if attendance_val.nil? # skip if there is not a value listed for attendance
                next if !(attendance_val == '0') # skip if the attendance value was not marked as present
                    
                member = members_hash[[arr[k][0], arr[k][1]]]
                
                Attendance.create({
                    tardy: false,
                    members_id: member.id,
                    meetings_id: meeting.id})
            end
        end
    end
end


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

arrs = [fall2021_data, spring2022_data, fall2022_data]
years = ['2021', '2022', '2022']
#parse_data(arrs, years)
