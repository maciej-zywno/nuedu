class Course < ActiveRecord::Base
  extend FriendlyId

  include Elasticsearch::Model
  include Elasticsearch::Model::Callbacks

  scope :recent, ->(num) { order('created_at DESC').limit(num) }


  friendly_id :name, :use => :slugged

  resourcify
  has_and_belongs_to_many :categories

  has_many :steps, -> { order('position asc')}
  has_many :attachments, as: :attachable
  has_one :exam, as: :examable
  has_many :reviews

  has_many :participations
  has_many :participants, through: :participations, source: :user

  has_many :announcements
  has_one :forum

  validates :name, presence: true
  validates :description, presence: true

  has_attached_file :logo, :styles => { medium: "300x300>", small: "200x200>", thumb: "100x100>" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :logo, :content_type => /\Aimage\/.*\Z/


  def published?
    status == 'PUBLISHED'
  end
end
