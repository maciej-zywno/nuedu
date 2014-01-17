class CreateSteps < ActiveRecord::Migration
  def change
    create_table :steps do |t|
      t.string :name
      t.references :course

      t.timestamps
    end
  
    add_index :steps, :course_id

  end

end
