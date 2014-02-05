class AddStatusIndexToCourses < ActiveRecord::Migration
  def change
    add_index :courses, :status    
  end
end
