require 'rails_helper'

RSpec.describe 'trainings/edit', type: :view do
  let(:training) do
    Training.create!(
      name: 'MyString',
      description: 'MyText',
      credit: 1
    )
  end

  before(:each) do
    assign(:training, training)
  end

  it 'renders the edit training form' do
    render

    assert_select 'form[action=?][method=?]', training_path(training), 'post' do
      assert_select 'input[name=?]', 'training[name]'

      assert_select 'textarea[name=?]', 'training[description]'

      assert_select 'input[name=?]', 'training[credit]'
    end
  end
end
