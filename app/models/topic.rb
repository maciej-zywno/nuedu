class Topic < ActiveRecord::Base


  # Associations
  has_many :posts, :dependent => :destroy
  belongs_to :forum, :counter_cache => true
  belongs_to :user
  
  
  # Validations
  validates :title,   :presence => true
  validates :body,    :presence => true, :on => :create
  validates :posts,   :presence => true, :allow_nil => false, :on => :update
  validates :user,    :presence => true
  
  
  # Callbacks
  after_create :create_initial_post
  
  private
    def create_initial_post
      self.posts.build(:body => self.body).tap do |post|
        post.user = self.user
        post.save
      end
    end
end
