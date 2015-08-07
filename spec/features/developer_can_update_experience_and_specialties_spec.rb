require 'rails_helper'

RSpec.feature "User can edit profile", type: :feature do
  include OmniAuthUser

  before do
    # OmniAuth.config.mock_auth[:google_oauth2] = nil
    Capybara.app = Foobr::Application
    stub_omniauth
  end

  context 'A developer' do
    it 'can add experience to their profile' do
      VCR.use_cassette("dev_update_profile") do
        visit root_path

        click_link "Sign up as a Developer"

        expect(page).to have_link("Developer Profile")

        within('#nav') { click_link "Developer Profile" }
        expect(page).to_not have_content('Tons!')
        click_link "Edit"
        fill_in "Experience", with: 'Tons!'
        click_button "Update My Profile"
        expect(page).to have_content('Tons!')
      end
    end
  end
end

