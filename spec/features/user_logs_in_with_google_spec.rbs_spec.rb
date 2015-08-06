require 'rails_helper'

RSpec.feature "User logs in with Google", type: :feature do
  include OmniAuthUser

  before do
    OmniAuth.config.mock_auth[:google_oauth2] = nil
    Capybara.app = Foobr::Application
    stub_omniauth
  end


  it 'is successful' do
    VCR.use_cassette("login") do
      visit root_path

      expect(page.status_code).to eq(200)

      click_link "Sign in with Google"

      expect(page).to have_css("#sign_out")
      expect(page).to have_link("Sign out")
    end
  end
end

