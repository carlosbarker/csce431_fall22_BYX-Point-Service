require 'rails_helper'

RSpec.describe('Access by an admin', type: :feature) do
end

RSpec.describe('Access by a member', type: :feature) do
    before :all do
        @member = Member.create!(full_name: 'John Doe', email: 'johndoe@tamu.edu', admin: false, graduated: false)
        @user = User.create!(full_name: 'John Doe', email: 'johndoe@tamu.edu', password: 'testPwd')
    end

    before do
        Rails.application.env_config['devise.mapping'] = Devise.mappings[:user]
        Rails.application.env_config['omniauth.auth'] = OmniAuth.config.mock_auth[:google_oauth2]
        visit 'users/sign_in'
        click_on 'Login'
    end

    after :all do
        @user.destroy!
        @member.destroy!
    end

    after do
        visit destroy_user_session_path
    end

    it 'no crud on members page' do
    end

    it 'no crud on calendar page' do
    end

    it 'no crud on alumni page' do
    end

    it 'no crud on dashboard page (announcements are read-only)' do
    end
end