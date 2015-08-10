require 'rails_helper'

RSpec.describe CalendarsController, type: :controller do

  describe "GET #primary" do
    xit "returns http success" do
      get :primary
      expect(response).to have_http_status(:success)
    end
  end

end
