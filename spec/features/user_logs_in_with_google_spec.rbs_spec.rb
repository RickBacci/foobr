require 'rails_helper'

RSpec.feature "User logs in with Google", type: :feature do
  include OmniAuthUser

  before do
    OmniAuth.config.mock_auth[:google_oauth2] = nil
    Capybara.app = Foobr::Application
    stub_omniauth
  end


  xit 'is successful' do
    VCR.use_cassette("login") do
      visit root_path

      expect(page.status_code).to eq(200)

      click_link "Sign in with Google"
save_and_open_page
      expect(page).to have_css("#sign_out")
      expect(page).to have_link("Sign out")
    end
  end
  xit 'needs to check for role'
  xit 'needs to set role'
end

