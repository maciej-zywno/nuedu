class Step < ActiveRecord::Base
  belongs_to :course

  has_one :exam, :inverse_of => :step
  has_one :video, :inverse_of => :step

  validates :name, presence: true
  validates :description, presence: true

  has_many :attachments, as: :attachable
end
