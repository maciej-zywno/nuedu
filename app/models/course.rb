class Course < ActiveRecord::Base
  resourcify
  has_many :steps


end
