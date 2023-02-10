require 'rails_helper'

RSpec.describe ProductFeature, type: :model do
  it 'Validates Products Features' do
    p = ProductFeature.new
    expect(p).not_to be_valid
    p = create(:product_feature)
    expect(p).to be_valid
  end
end
