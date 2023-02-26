require 'rails_helper'

RSpec.describe Category, type: :model do
  it 'validates presence of name' do
    expect(create(:category)).to be_valid
    expect(Category.new).not_to be_valid
  end
end
