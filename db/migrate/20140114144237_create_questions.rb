class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.string :kind
      t.string :question
      t.references :exam

      t.timestamps
    end
    add_index :questions, :exam_id

  end
end
