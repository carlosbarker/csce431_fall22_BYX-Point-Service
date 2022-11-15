require 'rails_helper'

RSpec.describe(Attendance, type: :model) do
    subject do
        described_class.new(tardy: false, members_id: @member.instance_variable_get(:@members_id), meetings_id: @meeting.instance_variable_get(:@meetings_id))
    end

    before :all do
        @member = Member.create!(full_name: "John Doe", email: "johndoe@tamu.edu", admin:false, graduated: false)
        @meeting = Meeting.create!(datetime: DateTime.now)
        @attendance = Attendance.create!(tardy: false, members_id: @member.instance_variable_get(:@members_id), meetings_id: @meeting.instance_variable_get(:@meetings_id))
    end

    after :all do
        @attendance.destroy!
        @meeting.destroy!
        @member.destroy!
    end

    it 'is valid with valid attributes' do
    end

    # add validation in model to force certain fields to be present
end