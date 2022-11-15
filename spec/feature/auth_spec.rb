require 'rails_helper'

RSpec.describe('Access by a member', type: :feature) do
    before :all do
        @member = Member.create!(full_name: 'John Doe', email: 'johndoe@tamu.edu', admin: false, graduated: false)
        @user = User.create!(full_name: 'John Doe', email: 'johndoe@tamu.edu', password: 'testPwd')
    end

    before do
        Rails.application.env_config['omniauth.auth'] = OmniAuth.config.mock_auth[:google_oauth2]
        visit new_user_session_path
        click_on 'login_button'  # based on ID of login button (technically a form submission button)
    end

    after :all do
        @user.destroy!
        @member.destroy!
    end

    after do
        visit destroy_user_session_path
    end

    it '- no crud on members page' do
        visit members_path
        expect(page).not_to(have_content("Show"))
        expect(page).not_to(have_content("Edit"))
        expect(page).not_to(have_content("Destroy"))
    end

    it '- no crud on calendar page' do
        visit events_path
        expect(page).not_to(have_content("Show"))
        expect(page).not_to(have_content("Edit"))
        expect(page).not_to(have_content("Destroy"))
    end

    it '- no crud on alumni page' do
        visit alumnus_path
        expect(page).not_to(have_content("Show"))
        expect(page).not_to(have_content("Edit"))
        expect(page).not_to(have_content("Destroy"))
    end

    it '- no crud on dashboard page (announcements are read-only)' do
        visit root_path
        expect(page).not_to(have_content("Show"))
        expect(page).not_to(have_content("Edit"))
        expect(page).not_to(have_content("Destroy"))
    end
end