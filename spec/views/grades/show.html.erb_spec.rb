require 'rails_helper'

RSpec.describe 'grades/show', type: :view do
  before(:each) do
    assign(:grade, Grade.create!(
                     user: nil,
                     course: nil,
                     grade: 2.5
                   ))
  end

  it 'renders attributes in <p>' do
    render
    expect(rendered).to match(//)
    expect(rendered).to match(//)
    expect(rendered).to match(/2.5/)
  end
end
