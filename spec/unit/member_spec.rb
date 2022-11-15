require 'rails_helper'

RSpec.describe(Member, type: :model) do
    subject do
        described_class.new(full_name: "John Doe", email: "johndoe@tamu.edu", admin: false, graduated: false)
    end

    before :all do
        @member = Member.create!(full_name: "John Doe", email: "johndoe@tamu.edu", admin:false, graduated: false)
    end

    after :all do
        @member.destroy!
    end

    it 'is valid with valid attributes' do
        expect(subject).to(be_valid)
    end

    # add validation in model to force certain fields to be present
    # e.g., full_name, email, admin, graduated
end