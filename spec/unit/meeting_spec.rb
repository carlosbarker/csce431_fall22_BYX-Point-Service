require 'rails_helper'

RSpec.describe(Meeting, type: :model) do
    subject do
        described_class.new(datetime: DateTime.now)
    end

    before :all do
        @meeting = Meeting.create!(datetime: DateTime.now)
    end

    after :all do
        @meeting.destroy!
    end

    it 'is valid with valid attributes' do
        expect(subject).to(be_valid)
    end

    # add validation in model to force certain fields to be present
end