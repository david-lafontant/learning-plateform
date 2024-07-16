require 'rails_helper'

RSpec.describe 'course_modules/edit', type: :view do
  let(:course_module) do
    CourseModule.create!(
      title: 'MyString',
      description: 'MyString',
      course: nil
    )
  end

  before(:each) do
    assign(:course_module, course_module)
  end

  it 'renders the edit course_module form' do
    render

    assert_select 'form[action=?][method=?]', course_module_path(course_module), 'post' do
      assert_select 'input[name=?]', 'course_module[title]'

      assert_select 'input[name=?]', 'course_module[description]'

      assert_select 'input[name=?]', 'course_module[course_id]'
    end
  end
end
