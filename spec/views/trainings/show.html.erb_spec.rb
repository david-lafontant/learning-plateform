require 'rails_helper'

RSpec.describe 'trainings/show', type: :view do
  before(:each) do
    assign(:training, Training.create!(
                        name: 'Name',
                        description: 'MyText',
                        credit: 2
                      ))
  end

  it 'renders attributes in <p>' do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/2/)
  end
end
