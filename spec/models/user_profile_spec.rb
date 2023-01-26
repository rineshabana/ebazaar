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
  end
end
