require 'rails_helper'

RSpec.describe "ContactFiles", type: :request do
  describe "GET /index" do
    it "returns http success" do
      get "/contact_files/index"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /show" do
    it "returns http success" do
      get "/contact_files/show"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /create" do
    it "returns http success" do
      get "/contact_files/create"
      expect(response).to have_http_status(:success)
    end
  end

end
