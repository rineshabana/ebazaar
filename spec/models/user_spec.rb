require 'rails_helper'

RSpec.describe User, type: :model do
  context 'Validation' do
    it 'Validates Email, Password' do
      u = User.new
      expect(u).not_to be_valid
      u = create(:user)
      expect(u).to be_valid
    end
    it 'can have multiple addresses' do
      u = create(:user)
      up = create(:user_profile, user: u)
      ua = create(:user_address, user_profile: up)
      ua2 = create(:user_address, user_profile: up)
      expect(u.user_addresses.count).to eql(2)
      expect(u.user_addresses.to_a).to eql([ua, ua2])
    end
  end
end
