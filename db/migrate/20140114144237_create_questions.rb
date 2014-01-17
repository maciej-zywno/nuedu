class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.string :kind
      t.string :question
      t.references :test

      t.timestamps
    end
    add_index :questions, :test_id

  end
end
