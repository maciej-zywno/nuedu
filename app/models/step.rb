class Step < ActiveRecord::Base

  belongs_to :course

  has_one :test
  has_one :video

end

