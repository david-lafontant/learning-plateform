class CreateGrades < ActiveRecord::Migration[7.0]
  def change
    create_table :grades do |t|
      # t.references :user, null: false, foreign_key: true
      t.belongs_to :student,  null: false, foreign_key: {to_table: :users}
      t.references :course, null: false, foreign_key: true
      t.float :grade

      t.timestamps
    end
  end
end
