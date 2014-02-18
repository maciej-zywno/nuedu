class CreateVideosStepProgresses < ActiveRecord::Migration
  def change
    create_table :videos_step_progresses do |t|
      t.references :video
      t.references :step_progress
    end
    add_index :videos_step_progresses, [:step_progress_id, :video_id], name: 's_p_v_index'

  end
end
