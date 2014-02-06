class Exam < ActiveRecord::Base
  belongs_to :step, :inverse_of => :exam
  has_many :questions

 accepts_nested_attributes_for :questions, :reject_if => lambda { |a| a[:question].blank? }, :allow_destroy => true
end
