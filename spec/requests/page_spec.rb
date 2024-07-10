require 'rails_helper'

RSpec.describe "Pages", type: :request do
  describe "GET /home" do

    it "returns http success" do
      sign_in User.create(email: "info@example.com", password: "Password2345")
      get "/"
      expect(response).to have_http_status(:success)
    end
  end

end
