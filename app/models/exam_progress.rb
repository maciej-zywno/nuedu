class ExamProgress < ActiveRecord::Base
  belongs_to :exam
  belongs_to :step_progress

  has_many :question_results

  accepts_nested_attributes_for :question_results

end
