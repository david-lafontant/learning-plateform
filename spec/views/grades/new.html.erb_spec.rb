require 'rails_helper'

RSpec.describe "grades/new", type: :view do
  before(:each) do
    assign(:grade, Grade.new(
      user: nil,
      course: nil,
      grade: 1.5
    ))
  end

  it "renders new grade form" do
    render

    assert_select "form[action=?][method=?]", grades_path, "post" do

      assert_select "input[name=?]", "grade[user_id]"

      assert_select "input[name=?]", "grade[course_id]"

      assert_select "input[name=?]", "grade[grade]"
    end
  end
end
