class StepProgress < ActiveRecord::Base

  scope :completed, -> { where(complete: true)}
  scope :incompleted, -> { where(complete: false)}
  belongs_to :step  
  belongs_to :course_progress

  delegate :user, to: :course_progress
  delegate :course, to: :course_progress

  has_many :exam_progresses
  has_and_belongs_to_many :watched_videos, class_name: 'Video', join_table: 'videos_step_progresses'
  belongs_to :last_watched_video
end
