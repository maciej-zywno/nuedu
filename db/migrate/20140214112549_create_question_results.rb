class CreateQuestionResults < ActiveRecord::Migration
  def change
    create_table :question_results do |t|
      t.references :exam_progress, index: true
      t.references :question, index: true
      t.references :answer, index: true

      t.timestamps
    end
  end
end
