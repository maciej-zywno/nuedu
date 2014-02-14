class CreateStepProgresses < ActiveRecord::Migration
  def change
    create_table :step_progresses do |t|
      t.references :step, index: true
      t.references :course_progress, index: true
      t.references :last_watched_video, index: true
      t.boolean :last_watched_video_exam

      t.timestamps
    end
  end
end
