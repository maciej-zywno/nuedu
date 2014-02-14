class CreateExamProgresses < ActiveRecord::Migration
  def change
    create_table :exam_progresses do |t|
      t.references :exam, index: true
      t.references :step_progress, index: true

      t.timestamps
    end
  end
end
