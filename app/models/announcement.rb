class Announcement < ActiveRecord::Base
  belongs_to :course
  belongs_to :user

  validates :title, :content, presence: true
end
