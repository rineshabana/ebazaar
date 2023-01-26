require 'rails_helper'

RSpec.describe 'Homes', type: :request do
  describe 'GET /index' do
    let(:user) { create(:user) }
    before do
      sign_in(user)
    end
    it 'returns http success' do
      get '/'
      expect(response).to have_http_status(:success)
    end
  end
end
