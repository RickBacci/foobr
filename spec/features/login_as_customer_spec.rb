require 'rails_helper'

RSpec.feature "User", type: :feature do
  include OmniAuthUser

  before do
    OmniAuth.config.mock_auth[:google_oauth2] = nil
    Capybara.app = Foobr::Application
    stub_omniauth
  end


  it 'can login as a customer' do
    VCR.use_cassette("login_as_customer") do
      visit root_path

      expect(page.status_code).to eql(200)

      click_link "Sign up as a Customer"

      expect(page).to have_css("#sign_out")
      expect(page).to have_link("Sign out")
      expect(page).to have_link("Profile")
    end
  end

  it 'can create a customer profile' do
    VCR.use_cassette("profile_as_customer") do
      visit root_path

      expect(page.status_code).to eql(200)

      click_link "Sign in with Google"

      expect(page).to have_css("#sign_out")
      expect(page).to have_link("Sign out")
      expect(page).to have_link("Profile")

      within('#nav') { click_link "Profile" }

      expect(page.status_code).to eql(200)
      expect(page).to have_content('Customer Profile')
      expect(page).to have_link('Edit Profile')

      click_link 'Edit Profile'

    end
  end
end

