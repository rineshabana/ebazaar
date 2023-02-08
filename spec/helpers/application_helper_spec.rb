require 'rails_helper'

RSpec.describe ApplicationHelper, type: :helper do
  let(:user_address) { create(:user_address) }
  it 'shows contact no' do
    expect(helper.show_contact_no(user_address)).to eql('+1-1234567890')
    expect(helper.show_contact_no(user_address.user_profile)).to eql('+91-12345678')
  end
end
