class Forum < ActiveRecord::Base

  belongs_to :course
  has_many :topics, :dependent => :destroy
  has_many :posts, :through => :topics

end
