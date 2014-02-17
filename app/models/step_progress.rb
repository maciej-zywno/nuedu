class StepProgress < ActiveRecord::Base
  belongs_to :step
  
  belongs_to :course_progress
  delegate :user, to: :course_progress
  delegate :course, to: :course_progress

  has_many :exam_progresses
  belongs_to :last_watched_video
end
