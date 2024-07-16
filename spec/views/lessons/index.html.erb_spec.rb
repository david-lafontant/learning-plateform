require 'rails_helper'

RSpec.describe 'lessons/index', type: :view do
  before(:each) do
    assign(:lessons, [
             Lesson.create!(
               title: 'Title',
               content: 'MyText',
               materials: nil,
               course_module: nil
             ),
             Lesson.create!(
               title: 'Title',
               content: 'MyText',
               materials: nil,
               course_module: nil
             )
           ])
  end

  it 'renders a list of lessons' do
    render
    cell_selector = Rails::VERSION::STRING >= '7' ? 'div>p' : 'tr>td'
    assert_select cell_selector, text: Regexp.new('Title'.to_s), count: 2
    assert_select cell_selector, text: Regexp.new('MyText'.to_s), count: 2
    assert_select cell_selector, text: Regexp.new(nil.to_s), count: 2
    assert_select cell_selector, text: Regexp.new(nil.to_s), count: 2
  end
end
