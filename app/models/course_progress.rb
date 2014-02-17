class CourseProgress < ActiveRecord::Base
  belongs_to :course
  belongs_to :user

  has_many :step_progresses

end
