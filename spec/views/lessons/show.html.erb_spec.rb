require 'rails_helper'

RSpec.describe "lessons/show", type: :view do
  before(:each) do
    assign(:lesson, Lesson.create!(
      title: "Title",
      content: "MyText",
      materials: nil,
      course_module: nil
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Title/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(//)
    expect(rendered).to match(//)
  end
end
