require 'rails_helper'

RSpec.describe ProductIdentifier, type: :model do
  it 'Validates Products Identifiers' do
    p = ProductIdentifier.new
    expect(p).not_to be_valid
    p = create(:product_identifier)
    expect(p).to be_valid
  end
end
