require 'rails_helper'

RSpec.describe SessionsController, type: :controller do
  include OmniAuthUser

  before do
    OmniAuth.config.mock_auth[:google_oauth2] = nil
    stub_omniauth
  end

  describe "GET #create" do
    xit "returns a User" do

      get :create, id: user.id, format: :json

      expect(response).to have_http_status(:success)
    end
  end

  describe "DELETE #destroy" do
    xit "deletes a Session" do

      delete :destroy, id: user.id, format: :json

      expect(JSON.parse(response.body)['name']).to be_nil
      expect(response).to have_http_status(:success)
    end
  end
end
