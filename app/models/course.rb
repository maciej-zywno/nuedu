class Course < ActiveRecord::Base
  resourcify
  has_many :steps

  belongs_to :category

  validates :name, presence: true
  validates :description, presence: true

  has_many :attachments, as: :attachable

  def published?
    status == 'PUBLISHED'
  end
end
