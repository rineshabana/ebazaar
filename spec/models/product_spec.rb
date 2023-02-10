require 'rails_helper'

RSpec.describe Product, type: :model do
  it 'Validates Products' do
    p = Product.new
    expect(p).not_to be_valid
    p = create(:product)
    expect(p).to be_valid
  end
end
