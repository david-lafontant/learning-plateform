require 'rails_helper'

RSpec.describe "course_modules/new", type: :view do
  before(:each) do
    assign(:course_module, CourseModule.new(
      title: "MyString",
      description: "MyString",
      course: nil
    ))
  end

  it "renders new course_module form" do
    render

    assert_select "form[action=?][method=?]", course_modules_path, "post" do

      assert_select "input[name=?]", "course_module[title]"

      assert_select "input[name=?]", "course_module[description]"

      assert_select "input[name=?]", "course_module[course_id]"
    end
  end
end
