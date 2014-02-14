class ExamProgress < ActiveRecord::Base
  belongs_to :exam
  belongs_to :step_progress
end
