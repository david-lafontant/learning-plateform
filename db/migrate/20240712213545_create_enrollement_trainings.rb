class CreateEnrollementTrainings < ActiveRecord::Migration[7.0]
  def change
    create_table :enrollement_trainings do |t|
      t.references :training, null: false, foreign_key: true
      # t.references :user, null: false, foreign_key: true
      t.belongs_to :student,  null: false, foreign_key: {to_table: :users}

      t.timestamps
    end
  end
end
