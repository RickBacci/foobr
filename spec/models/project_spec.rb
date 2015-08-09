require 'rails_helper'

RSpec.describe Project, type: :model do
  include OmniAuthUser
  let(:user) { stub_user }

  it 'is valid with a name and user_id' do
    project = user.projects.create!(name: 'new project')

    expect(project).to be_valid
  end

  it 'is invalid without a name' do
    project = user.projects.create(name: nil)

    expect(project).to be_invalid
  end
end

