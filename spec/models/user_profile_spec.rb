require 'rails_helper'

RSpec.describe UserProfile, type: :model do
  context 'User profile validation' do
    let(:user_profile) { create(:user_profile) }
    it 'should check the validity' do
      expect(user_profile).to be_valid
      expect(UserProfile.new).not_to be_valid
    end
    it 'should allow unique users id' do
      user_profile
      expect do
        UserProfile.create!(user_id: user_profile.user_id)
      end.to raise_error(ActiveRecord::RecordInvalid)
    end
    it 'can have multiple addresses' do
      ua = create(:user_address, user_profile: user_profile)
      ua2 = create(:user_address, user_profile: user_profile)
      expect(user_profile.user_addresses.count).to eql(2)
      expect(user_profile.user_addresses.to_a).to eql([ua, ua2])
    end
  end
end
