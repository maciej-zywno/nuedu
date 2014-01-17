class Test < ActiveRecord::Base
  belongs_to :step

  has_many :questions
end
