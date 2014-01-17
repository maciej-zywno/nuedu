class Course < ActiveRecord::Base
  resourcify
  has_many :steps
  
  belongs_to :category  

end
