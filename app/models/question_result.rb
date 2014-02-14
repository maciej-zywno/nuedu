class QuestionResult < ActiveRecord::Base
  belongs_to :exam_progress
  belongs_to :question
  belongs_to :answer
end
