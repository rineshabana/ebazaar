require 'rails_helper'

# Specs in this file have access to a helper object that includes
# the UserProfileHelper. For example:
#
# describe UserProfileHelper do
#   describe "string concat" do
#     it "concats two strings with spaces" do
#       expect(helper.concat_strings("this","that")).to eq("this that")
#     end
#   end
# end
RSpec.describe UserProfileHelper, type: :helper do
  let(:profile) { create(:user_profile) }
  it 'Formats the data' do
    expect(helper.fullname(profile)).to eql('Jhon Sam Dean')
    profile.middle_name = ''
    expect(helper.fullname(profile)).to eql('Jhon Dean')
  end

  it 'shows gender' do
    expect(helper.showgender(profile)).to eql('Male')
    profile.gender = 2
    expect(helper.showgender(profile)).to eql('Female')
  end

  it 'shows contact no' do
    expect(helper.show_contact_no(profile)).to eql('+91-12345678')
  end
end
