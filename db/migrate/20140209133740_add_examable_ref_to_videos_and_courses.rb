class AddExamableRefToVideosAndCourses < ActiveRecord::Migration
  def change
    add_reference :exams, :examable, polymorphic:true
  end
end
