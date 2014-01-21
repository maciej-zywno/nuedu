class Course < ActiveRecord::Base
  resourcify
  has_many :steps

  belongs_to :category

  validates :name, presence: true
  validates :description, presence: true

end
