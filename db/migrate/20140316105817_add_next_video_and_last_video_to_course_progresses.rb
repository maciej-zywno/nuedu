class AddNextVideoAndLastVideoToCourseProgresses < ActiveRecord::Migration
  def change
    add_reference :course_progresses, :next_video, index: true
    add_reference :course_progresses, :last_video, index: true
  end
end
