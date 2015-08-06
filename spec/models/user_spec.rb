require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) { User.create!(provider: 'google_oauth2',
                            uid: '12345',
                            name: 'Joe',
                            email: 'joe@smo.com',
                            oauth_token: '175',
                            oauth_expires_at: '1438814378' )}

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

    xit 'without an oauth expiration' do
      user.oauth_expires_at = nil

      expect(user).to be_invalid
    end
  end
end
