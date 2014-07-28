class RemoveCategoryFromCourses < ActiveRecord::Migration
  def change
    remove_reference :courses, :category, index: true
  end
end
