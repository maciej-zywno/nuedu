class Test < ActiveRecord::Base
  belongs_to :step, :inverse_of => :test
  has_many :questions

  def to_s
    name  
  end
end
