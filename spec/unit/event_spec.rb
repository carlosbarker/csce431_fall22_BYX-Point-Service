require 'rails_helper'

RSpec.describe(Event, type: :model) do
    subject do
        described_class.new(title: "Test Event", description: "Test Description", datetime: DateTime.now)
    end

    before :all do
        @event = Event.create!(title: "Test Event", description: "Test Description", datetime: DateTime.now)
    end

    after :all do
        @event.destroy!
    end

    it 'is valid with valid attributes' do
        expect(subject).to(be_valid)
    end
end