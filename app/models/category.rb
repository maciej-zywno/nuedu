class Category < ActiveRecord::Base
  has_ancestry
  has_and_belongs_to_many :courses

  def parent_enum
    Category.where.not(id: id).map { |c| [ c.name, c.id ] }
  end
  
end
