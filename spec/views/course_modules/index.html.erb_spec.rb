require 'rails_helper'

RSpec.describe 'course_modules/index', type: :view do
  before(:each) do
    assign(:course_modules, [
             CourseModule.create!(
               title: 'Title',
               description: 'Description',
               course: nil
             ),
             CourseModule.create!(
               title: 'Title',
               description: 'Description',
               course: nil
             )
           ])
  end

  it 'renders a list of course_modules' do
    render
    cell_selector = Rails::VERSION::STRING >= '7' ? 'div>p' : 'tr>td'
    assert_select cell_selector, text: Regexp.new('Title'.to_s), count: 2
    assert_select cell_selector, text: Regexp.new('Description'.to_s), count: 2
    assert_select cell_selector, text: Regexp.new(nil.to_s), count: 2
  end
end
