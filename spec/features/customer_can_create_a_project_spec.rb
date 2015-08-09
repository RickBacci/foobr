require 'rails_helper'

RSpec.feature "Customer", type: :feature do
  include OmniAuthUser

  before do
    OmniAuth.config.mock_auth[:google_oauth2] = nil
    Capybara.app = Foobr::Application
    stub_omniauth
  end

  it 'can create a new project' do
    visit root_path

    expect(page.status_code).to eql(200)

    find('#customer_signup').click

    expect(page).to have_link("Create a New Project")

    within('#nav') { click_link "Create a New Project" }

    expect(page.status_code).to eql(200)
    expect(page).to have_content('New Project')

    fill_in "Name", with: "ABC Company website"
    fill_in "Description", with: 'I would like my About page updated'

    click_button "Create Project"
    expect(page).to have_content("ABC Company website")
    expect(page).to have_content("I would like by About page updated")
  end
end

