require 'rails_helper'

RSpec.feature "User logs in with no role", type: :feature do
  include OmniAuthUser

  before do
    OmniAuth.config.mock_auth[:google_oauth2] = nil
    Capybara.app = Foobr::Application
    stub_omniauth
  end


  it 'should not be successful' do
    visit root_path
    expect(page.status_code).to eq(200)

    click_link "Sign in with Google"

    expect(page).to_not have_css("#sign_out")
    expect(page).to_not have_link("Sign out")
  end

  it 'should redirect for user to choose role' do
    visit root_path
    expect(page.status_code).to eq(200)

    click_link "Sign in with Google"

    expect(page).to have_content 'Are you a developer or a customer?'

  end
end
