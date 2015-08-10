require 'rails_helper'

RSpec.feature "User can edit profile", type: :feature do
  include OmniAuthUser

  before do
    OmniAuth.config.mock_auth[:google_oauth2] = nil
    Capybara.app = Foobr::Application
    stub_omniauth
  end

  context 'A developer' do
    xit 'can add experience to their profile' do
      VCR.use_cassette("dev_update_profile") do
        visit root_path

        click_link "Sign up as a Developer"

        expect(page).to have_link("Profile")

        within('#nav') { click_link "Profile" }
        expect(page).to_not have_content('Tons!')
        click_link "Edit"

        within('#experience') { fill_in "Experience", with: 'Tons!' }
        click_button "Update My Profile"
        expect(page).to have_content('Tons!')
      end
    end

    xit 'can add specialties to their profile' do
      VCR.use_cassette("dev_update_specialty") do
        visit root_path

        click_link "Sign up as a Developer"
        within('#nav') { click_link "Profile" }

        expect(page).to_not have_content('Ruby on Rails')

        click_link "Edit"
        click_link "View Specialties"
        click_link "Add Specialty"
        within('.new_specialty') { fill_in "Name", with: "Ruby on Rails" }
        click_button "Submit"

        expect(page).to have_content('Ruby on Rails')
      end
    end
  end
end

