class QuestionResult < ActiveRecord::Base
  belongs_to :exam_progress
  belongs_to :question
  belongs_to :answer
  
  has_and_belongs_to_many :answers

end
