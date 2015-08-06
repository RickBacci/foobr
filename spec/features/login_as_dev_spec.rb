require 'rails_helper'

RSpec.feature "User", type: :feature do
  include OmniAuthUser

  before do
    OmniAuth.config.mock_auth[:google_oauth2] = nil
    Capybara.app = Foobr::Application
    stub_omniauth
  end


  it 'can login as a developer' do
    VCR.use_cassette("login_as_dev") do
      visit root_path

      assert_equal 200, page.status_code

      click_link "Sign up as a Developer"

      expect(page).to have_css("#sign_out")
      expect(page).to have_link("Sign out")
      expect(page).to have_link("Profile")
    end
  end
end

