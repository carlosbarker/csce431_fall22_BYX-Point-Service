require 'rails_helper'

RSpec.describe(ServicePoint, type: :model) do
    subject do
        described_class.new(datetime: DateTime.now, members_id: @member.instance_variable_get(:@members_id), events_id: @event.instance_variable_get(:@events_id))
    end

    before :all do
        @event = Event.create!(title: "Test Event", description: "Test Description", datetime: DateTime.now)
        @member = Member.create!(full_name: "John Doe", email: "johndoe@tamu.edu", admin:false, graduated: false)
        @servicepoint = ServicePoint.create!(datetime: DateTime.now, members_id: @member.instance_variable_get(:@members_id), events_id: @event.instance_variable_get(:@events_id))
    end
    
    after :all do
        @servicepoint.destroy!
        @event.destroy!
        @member.destroy!
    end

    it 'is valid with valid attributes' do
        expect(subject).to(be_valid)
    end

    # add validation in model to force certain fields to be present
end