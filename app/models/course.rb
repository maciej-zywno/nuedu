class Course < ActiveRecord::Base
  resourcify

  belongs_to :category

  has_many :steps
  has_many :attachments, as: :attachable
  has_one :exam, as: :examable


  validates :name, presence: true
  validates :description, presence: true

  def published?
    status == 'PUBLISHED'
  end
end
