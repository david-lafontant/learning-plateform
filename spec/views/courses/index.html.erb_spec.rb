require 'rails_helper'

RSpec.describe "courses/index", type: :view do
  before(:each) do
    assign(:courses, [
      Course.create!(
        name: "Name",
        code: "Code",
        description: "Description",
        credit: "Credit",
        user: nil
      ),
      Course.create!(
        name: "Name",
        code: "Code",
        description: "Description",
        credit: "Credit",
        user: nil
      )
    ])
  end

  it "renders a list of courses" do
    render
    cell_selector = Rails::VERSION::STRING >= '7' ? 'div>p' : 'tr>td'
    assert_select cell_selector, text: Regexp.new("Name".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("Code".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("Description".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("Credit".to_s), count: 2
    assert_select cell_selector, text: Regexp.new(nil.to_s), count: 2
  end
end
