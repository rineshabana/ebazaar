require 'rails_helper'

RSpec.describe "Products", type: :request do
  let(:u) { create(:user) }
  before do
    sign_in(u)
  end
  
  describe "GET /index" do
    it "returns http success" do
      get "/products/index" , xhr: true
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /new" do
    it "returns http success" do
      get "/products/new" , xhr: true
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /create" do
    it "returns http success" do
      get "/products/create", xhr: true
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /edit" do
    it "returns http success" do
      get "/products/edit", xhr: true
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /update" do
    it "returns http success" do
      get "/products/update", xhr: true
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /destroy" do
    it "returns http success" do
      get "/products/destroy", xhr: true
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /show" do
    it "returns http success" do
      get "/products/show", xhr: true
      expect(response).to have_http_status(:success)
    end
  end

end
