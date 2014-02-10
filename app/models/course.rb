class Course < ActiveRecord::Base
  resourcify

  has_and_belongs_to_many :categories

  has_many :steps
  has_many :attachments, as: :attachable
  has_one :exam, as: :examable


  validates :name, presence: true
  validates :description, presence: true

  def published?
    status == 'PUBLISHED'
  end
end
