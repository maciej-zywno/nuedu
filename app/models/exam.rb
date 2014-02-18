class Exam < ActiveRecord::Base
  belongs_to :examable, polymorphic: true
  delegate :course, to: :examable
  has_many :questions

  accepts_nested_attributes_for :questions, :reject_if => lambda { |a| a[:question].blank? }, :allow_destroy => true

  def step
      if examable.class == Step
        examable
      else 
        examable.step
      end
  end

end
