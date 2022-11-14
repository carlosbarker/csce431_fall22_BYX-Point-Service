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
def parse_data(arrs, years, emails)
    meeting_indexes = [] # col index for meeting in a csv
    all_meetings = [] # holds meeting model data
    members_hash = Hash.new # members hash, will be filled with (key: full_name) and (value: Member object) pairs.

    email_names = []
    #iterate through emails csv to store full_names
    emails.each do |row|
        if row[0].nil? || row[1].nil?
            email_names.append('EMPTY VALUE')
            next
        end
        email_names.append(row[0] + ' ' + row[1])
    end

    # iterate through the csvs, create meetings and members
    for i in 0..arrs.size()-1
        # add meetings to database and get indexes of each meeting in each csv
        indexes, meetings = parse_meetings(arrs[i], years[i])
        meeting_indexes.append(indexes)
        all_meetings.append(meetings)
        for j in 1..arrs[i].size()-1
            next if arrs[i][j][0].nil? || arrs[i][j][1].nil? # if there is no name or no cardid, then skip making a member

            if members_hash.include?(arrs[i][j][1]) # if member has already been added/created
                next
                
            else # if member has not been added/created
                #tokens = arrs[i][j][1].split(' ')
                #fname = tokens[0]
                #lname = tokens[1]
                email_i = email_names.find_index(arrs[i][j][1])

                if email_i.nil? || emails[email_i][2] == ''
                    member = Member.create({
                        full_name: arrs[i][j][1],
                        card_id: arrs[i][j][0],
                        graduated: false
                    })
                else
                    member = Member.create({
                        full_name: arrs[i][j][1],
                        card_id: arrs[i][j][0],
                        email: emails[email_i][2],
                        graduated: false
                    })
                end

                members_hash[arrs[i][j][1]] = member
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
                next if !members_hash.include?(arr[k][1]) # skip if hashmap doesnt have key: full_name

                attendance_val = arr[k][col]
                
                next if attendance_val.nil? # skip if there is not a value listed for attendance
                next if !(attendance_val == '0') # skip if the attendance value was not marked as present
                    
                member = members_hash[arr[k][1]]
  
                Attendance.create({
                    tardy: false,
                    members_id: member.id,
                    meetings_id: meeting.id})
            end
        end
    end
end

User.destroy_all

ServicePoint.destroy_all
Attendance.destroy_all

Event.destroy_all
Meeting.destroy_all

Member.destroy_all

# adding devs as members
trevorh = Member.create({
    full_name: "Trevor Hatch",
    email: "trevorhatch@tamu.edu",
    card_id: "lol I am a dev",
    graduated: true,
    admin: true
    })

Member.create({
    full_name: "Carlos Barker",
    email: "cbarker@tamu.edu",
    card_id: "lol I am a dev 2",
    graduated: true,
    admin: true
    })

Member.create({
    full_name: "Ram Pangaluri",
    email: "raamus2000@tamu.edu",
    card_id: "lol I am a dev 3",
    graduated: false,
    admin: true
    })

trevoru = Member.create({
    full_name: "Trevor Underwood",
    email: "trevor012@tamu.edu",
    card_id: "lol I am a dev 4",
    graduated: true,
    admin: true
    })

Member.create({
    full_name: "Vyas Chitti",
    email: "chittiv1113@tamu.edu",
    card_id: "lol I am a dev 5",
    graduated: false,
    admin: true
    })

event1 = Event.create({
    datetime: "11-10-2022",
    title: "saving puppies",
    description: "meet us at the corner of Texas Ave and University to save the puppies"
    })

event2 = Event.create({
    datetime: "11-2-2022",
    title: "World Peace",
    description: "Jump up and down and spin in a circle"
    })

meeting1 = Meeting.create(
    datetime: "11-8-2022"
)


Attendance.create(
    tardy: false,
    members_id: trevoru.id,
    meetings_id: meeting1.id
)

ServicePoint.create({
    members_id: trevoru.id,
    created_at: "11-05-2022",
    updated_at: "11-05-2022",
    events_id: event1.id
})

ServicePoint.create({
    members_id: trevoru.id,
    events_id: event2.id
})

ServicePoint.create({
    members_id: trevorh.id,
    events_id: event2.id
})

ServicePoint.create({
})
@meeting1 = Meeting.create({

})
Attendance.create({
    tardy: false,
    members_id: trevoru.id,
    meetings_id: @meeting1.id
})

# create an array of rows for the existing csv data files
fall2021_data = CSV.read(Rails.root.join('lib', 'seeds', 'fall2021.csv'))
spring2022_data = CSV.read(Rails.root.join('lib', 'seeds', 'spring2022.csv'))
fall2022_data = CSV.read(Rails.root.join('lib', 'seeds', 'fall2022.csv'))
emails_data = CSV.read(Rails.root.join('lib', 'seeds', 'emails.csv'))

arrs = [fall2022_data, spring2022_data, fall2021_data]
years = ['2022', '2022', '2021']
parse_data(arrs, years, emails_data)
