class Step < ActiveRecord::Base
  belongs_to :course

  has_one :test, :inverse_of => :step
  has_one :video, :inverse_of => :step

  validates :name, presence: true
  validates :description, presence: true

end
