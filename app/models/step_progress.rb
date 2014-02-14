class StepProgress < ActiveRecord::Base
  belongs_to :step
  belongs_to :course_progress
  belongs_to :last_watched_video
end
