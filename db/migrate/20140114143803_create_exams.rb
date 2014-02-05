class CreateExams < ActiveRecord::Migration
  def change
    create_table :exams do |t|
      t.string :name
      t.references :step

      t.timestamps
    end
    add_index :exams, :step_id

  end
end
