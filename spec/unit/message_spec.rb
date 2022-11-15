require 'rails_helper'

RSpec.describe(Message, type: :model) do
    subject do
        described_class.new(title: "Test Title", body: "Test Body")
    end

    before :all do
        @message = Message.create!(title: "Test Title", body: "Test Body")
    end

    after :all do
        @message.destroy!
    end

    it 'is valid with valid attributes' do
        expect(subject).to(be_valid)
    end

    # add validation in model to force certain fields to be present
end