class Exam < ActiveRecord::Base
  belongs_to :step, :inverse_of => :exam
  has_many :questions

  def to_s
    name  
  end
end
