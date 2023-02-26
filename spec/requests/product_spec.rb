require 'rails_helper'
# rubocop:disable Metrics/BlockLength
RSpec.describe 'Products', type: :request do
  let(:u) { create(:user) }
  before do
    sign_in(u)
  end

  describe 'GET /index' do
    it 'returns http success' do
      get products_path, xhr: true
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET /new' do
    it 'returns http success' do
      get new_product_path, xhr: true
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET /create' do
    it 'returns http success' do
      file = fixture_file_upload('spec/factories/images/test_image.jpeg')
      post products_path, params: { product: { name: 'Name', price: 'Price', image: file, categories: [''] } },
                          xhr:    true
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET /edit' do
    it 'returns http success' do
      prod = create(:product)
      get edit_product_path(prod.id), xhr: true
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET /update' do
    it 'returns http success' do
      prod = create(:product)
      file = fixture_file_upload('spec/factories/images/test_image.jpeg')
      put product_path(prod.id), params: { product: { name: 'Name', price: 'Price', image: file, categories: [''] } },
                                 xhr:    true
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET /show' do
    it 'returns http success' do
      prod = create(:product)
      prod.image.attach(io: File.open('spec/factories/images/test_image.jpeg'), filename: 'test_image.jpeg',
                        content_type: 'image/jpeg')
      get product_path(prod.id), xhr: true
      expect(response).to have_http_status(:success)
    end
  end
end
# rubocop:enable Metrics/BlockLength
