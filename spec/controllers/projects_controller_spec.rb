require 'rails_helper'

RSpec.describe ProjectsController, type: :controller do

  describe "GET #new" do
    xit "returns http success" do

      get :new
      expect(response).to have_http_status(:success)
    end
  end
end
