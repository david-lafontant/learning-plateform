require 'rails_helper'

RSpec.describe 'lessons/new', type: :view do
  before(:each) do
    assign(:lesson, Lesson.new(
                      title: 'MyString',
                      content: 'MyText',
                      materials: nil,
                      course_module: nil
                    ))
  end

  it 'renders new lesson form' do
    render

    assert_select 'form[action=?][method=?]', lessons_path, 'post' do
      assert_select 'input[name=?]', 'lesson[title]'

      assert_select 'textarea[name=?]', 'lesson[content]'

      assert_select 'input[name=?]', 'lesson[materials]'

      assert_select 'input[name=?]', 'lesson[course_module_id]'
    end
  end
end
