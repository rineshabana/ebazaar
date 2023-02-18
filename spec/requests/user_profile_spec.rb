require 'rails_helper'
# rubocop:disable Metrics/BlockLength
RSpec.describe 'UserProfiles', type: :request do
  let(:u) { create(:user) }
  let(:user_pf) { create(:user_profile, user: u) }
  let(:u2) { create(:user, email: 'test@def.com') }
  before do
    user_pf
    sign_in(u)
  end
  describe 'GET /add' do
    let(:u3) { create(:user, email: 'test@deff.com') }
    before do
      sign_in(u3)
    end
    it 'opens a form to create a profile' do
      get user_profile_path, xhr: true
      expect(response).to have_http_status(:success)
      expect(response.body.include?('<form')).to eql(true)
    end
  end

  describe 'GET /create' do
    before do
      sign_out(u)
      sign_in(u2)
    end
    it 'creates a new profile' do
      profile_count = UserProfile.count
      post user_profile_path, params: { user_profile: { first_name: 'Shabana', middle_name: '', last_name: 'Noor',
                                        dob: DateTime.new(1995, 3, 28), gender: 2, country_code: '91',
                                        contact_number: '1234567890' } }, xhr: true
      expect(response).to have_http_status(:success)
      expect(UserProfile.count).to eql(profile_count + 1)
    end
  end

  describe 'GET /edit' do
    it 'returns http success' do
      get edit_user_profile_path, xhr: true
      expect(response).to have_http_status(:success)
    end
  end

  describe 'PUT /update' do
    before do
      sign_in(u)
    end
    it 'Updates user profile' do
      old_name = "#{user_pf.first_name} #{user_pf.middle_name} #{user_pf.last_name}"
      put user_profile_path, params: { user_profile: { first_name: 'Sam', middle_name: 'John', last_name: 'Dean',
                                         dob: DateTime.new(1995, 3, 28), gender: 2, country_code: '91',
                                         contact_number: '1234567890' } }, xhr: true
      updated_profile = u.user_profile
      new_name = "#{updated_profile.first_name} #{updated_profile.middle_name} #{updated_profile.last_name}"
      expect(response).to have_http_status(:success)
      expect(old_name).not_to eql(new_name)
    end
  end

  describe 'GET /show' do
    it 'returns http success' do
      get user_profile_path, xhr: true
      expect(response).to have_http_status(:success)
    end
  end
end
# rubocop:enable Metrics/BlockLength
