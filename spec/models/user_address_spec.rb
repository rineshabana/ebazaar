require 'rails_helper'

RSpec.describe UserAddress, type: :model do
  context 'User address validation' do
    let(:ua) { create(:user_address) }
    it 'should check the validity' do
      expect(ua).to be_valid
      expect(UserAddress.new).not_to be_valid
    end
  end
end
