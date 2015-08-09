require 'rails_helper'

RSpec.describe User, type: :model do
  include OmniAuthUser

  let(:user) { stub_user }

  context 'is valid' do
    it 'with valid attributes' do
      expect(user).to be_valid
    end
  end

  context 'is invalid' do
    it 'without a uid' do
      user.uid = nil

      expect(user).to be_invalid
    end

    it 'without a name' do
      user.name = nil

      expect(user).to be_invalid
    end

    it 'without an email' do
      user.email = nil

      expect(user).to be_invalid
    end

    it 'without an oauth_token' do
      user.oauth_token = nil

      expect(user).to be_invalid
    end
  end

  context 'with a customer role' do
    it 'starts with no projects' do
      expect(user.projects.size).to eql(0)
    end

    it 'can create a new project' do
      user.projects.create(name: 'wicked cool project')

      expect(user.projects.size).to eql(1)
    end
  end
end
