require 'rails_helper'

RSpec.describe 'home/index.html.erb', type: :view do
  context 'index view' do
    it 'renders properly' do
      render
      expect(rendered).to eql("<h1>Home#index</h1>\n<p>Find me in app/views/home/index.html.erb</p>\n")
    end
  end
end
