class CreateCategoriesCoursesJoin < ActiveRecord::Migration
  def change
    create_table :categories_courses, id: false do |t|
      t.integer :category_id
      t.integer :course_id
      t.timestamps
    end
    add_index :categories_courses, [:category_id, :course_id]
  end
end
