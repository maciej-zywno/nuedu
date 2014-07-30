class CourseProgress < ActiveRecord::Base
  belongs_to :course
  belongs_to :user

  belongs_to :next_video, class_name: 'Video'
  belongs_to :last_video, class_name: 'Video'
  has_many :step_progresses

end
