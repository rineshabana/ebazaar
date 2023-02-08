require 'rails_helper'

# Specs in this file have access to a helper object that includes
# the UserAddressHelper. For example:
#
# describe UserAddressHelper do
#   describe "string concat" do
#     it "concats two strings with spaces" do
#       expect(helper.concat_strings("this","that")).to eq("this that")
#     end
#   end
# end
RSpec.describe UserAddressHelper, type: :helper do
  it { expect(helper.address_number(1)).to eql('Address 2') }
end
