require 'rails_helper'

RSpec.describe "course_modules/show", type: :view do
  before(:each) do
    assign(:course_module, CourseModule.create!(
      title: "Title",
      description: "Description",
      course: nil
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Title/)
    expect(rendered).to match(/Description/)
    expect(rendered).to match(//)
  end
end
