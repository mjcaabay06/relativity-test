class CreateExamAnswers < ActiveRecord::Migration[5.1]
  def change
    create_table :exam_answers do |t|
      t.references :exam, foreign_key: true
      t.references :question, foreign_key: true
      t.references :answer, foreign_key: true

      t.timestamps
    end
  end
end
