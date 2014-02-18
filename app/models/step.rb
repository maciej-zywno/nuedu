class Step < ActiveRecord::Base
  belongs_to :course
  has_many :videos, -> { order('position asc')}
  has_many :attachments, as: :attachable
  has_one :exam, as: :examable


  validates :name, presence: true
  validates :description, presence: true

  def next_video(video)
    videos.where(position: (video.position+1)).first
  end

  def next_video_after_exam(exam)
    if exam.examable == Video
      videos.where(position: (exam.examable.position+1)).first
    end
  end


end
