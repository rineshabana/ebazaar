require 'rails_helper'

RSpec.describe User, type: :model do
  context 'Validation' do
    it 'Validates Email, Password' do
      u = User.new
      expect(u).not_to be_valid
      u = create(:user)
      expect(u).to be_valid
    end
  end
end
