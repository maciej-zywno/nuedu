class AddAttachmentsToStepsAndCourses < ActiveRecord::Migration
  def change
    add_reference :courses, :attachable, polymorphic:true
    add_reference :steps, :attachable, polymorphic:true
  end
end
