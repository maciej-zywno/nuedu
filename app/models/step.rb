class Step < ActiveRecord::Base
  belongs_to :course
  has_many :videos, :inverse_of => :step
  has_many :attachments, as: :attachable
  has_many :exams, as: :examable


  validates :name, presence: true
  validates :description, presence: true

end
