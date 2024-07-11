class CreateCourseTrainings < ActiveRecord::Migration[7.0]
  def change
    create_table :course_trainings do |t|
      t.belongs_to :course, null: false, foreign_key: true
      t.belongs_to :training, null: false, foreign_key: true

      t.timestamps
    end
  end
end
