class User < ActiveRecord::Base
  rolify
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
    :recoverable, :rememberable, :trackable, :validatable, :omniauthable, :omniauth_providers => [:facebook, :twitter, :linkedin]

  validates :username, presence: true

  after_create :assign_student_role
  after_create :send_welcome_email

  has_many :participations
  has_many :courses,  through: :participations
  has_many :course_progresses

  has_attached_file :avatar, :styles => { medium: "300x300>", small: "200x200>", thumb: "128x128>" }, :default_url => ActionController::Base.helpers.asset_path("avatar-missing.jpeg")
  validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/

  def self.from_omniauth(auth)
    where(auth.slice(:provider, :uid)).first_or_create do |user|
      user.provider = auth.provider
      user.uid = auth.uid
      user.username = auth.info.name
      # user.username = auth.info.nickname
      user.email = auth.info.email
    end
  end

  def self.new_with_session(params, session)
    if session["devise.user_attributes"]
      new(session["devise.user_attributes"], without_protection: true) do |user|
        user.attributes = params
        user.valid?
      end
    else
      super
    end
  end

  def password_required?
    super && provider.blank?
  end

  def update_with_password(params, *options)
    if encrypted_password.blank?
      update_attributes(params, *options)
    else
      super
    end
  end

  private
  def assign_student_role
    add_role(:student)
    add_role(:teacher)

  end

  def send_welcome_email
    UserMailer.welcome_email(self).deliver
  end
end
