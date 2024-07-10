require 'rails_helper'

RSpec.describe "courses/edit", type: :view do
  let(:course) {
    Course.create!(
      name: "MyString",
      code: "MyString",
      description: "MyString",
      credit: "MyString",
      user: nil
    )
  }

  before(:each) do
    assign(:course, course)
  end

  it "renders the edit course form" do
    render

    assert_select "form[action=?][method=?]", course_path(course), "post" do

      assert_select "input[name=?]", "course[name]"

      assert_select "input[name=?]", "course[code]"

      assert_select "input[name=?]", "course[description]"

      assert_select "input[name=?]", "course[credit]"

      assert_select "input[name=?]", "course[user_id]"
    end
  end
end
