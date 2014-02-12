class Step < ActiveRecord::Base
  belongs_to :course
  has_many :videos, :inverse_of => :step
  has_many :attachments, as: :attachable
  has_one :exam, as: :examable


  validates :name, presence: true
  validates :description, presence: true

end
