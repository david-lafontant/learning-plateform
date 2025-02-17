require 'rails_helper'

RSpec.describe 'courses/new', type: :view do
  before(:each) do
    assign(:course, Course.new(
                      name: 'MyString',
                      code: 'MyString',
                      description: 'MyString',
                      credit: 'MyString',
                      user: nil
                    ))
  end

  it 'renders new course form' do
    render

    assert_select 'form[action=?][method=?]', courses_path, 'post' do
      assert_select 'input[name=?]', 'course[name]'

      assert_select 'input[name=?]', 'course[code]'

      assert_select 'input[name=?]', 'course[description]'

      assert_select 'input[name=?]', 'course[credit]'

      assert_select 'input[name=?]', 'course[user_id]'
    end
  end
end
