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

  it 'can edit thier profile' do
    VCR.use_cassette("profile_as_customer") do
      visit root_path

      expect(page.status_code).to eql(200)

      find('#customer_signup').click

      expect(page).to have_css("#sign_out")
      expect(page).to have_link("Sign out")
      expect(page).to have_link("Customer Profile")

      within('#nav') { click_link "Customer Profile" }

      expect(page.status_code).to eql(200)
      expect(page).to have_content('Customer Profile')

      expect(page).to have_link('Edit')
      expect(page).to_not have_content("Best Company Ever!")

      click_link 'Edit'

      fill_in "Company name", with: "Best Company Ever!"
      click_button "Update My Profile"
      expect(page).to have_content("Best Company Ever!")
    end
  end
end

