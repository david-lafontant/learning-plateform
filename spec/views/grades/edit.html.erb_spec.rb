require 'rails_helper'

RSpec.describe 'grades/edit', type: :view do
  let(:grade) do
    Grade.create!(
      user: nil,
      course: nil,
      grade: 1.5
    )
  end

  before(:each) do
    assign(:grade, grade)
  end

  it 'renders the edit grade form' do
    render

    assert_select 'form[action=?][method=?]', grade_path(grade), 'post' do
      assert_select 'input[name=?]', 'grade[user_id]'

      assert_select 'input[name=?]', 'grade[course_id]'

      assert_select 'input[name=?]', 'grade[grade]'
    end
  end
end
