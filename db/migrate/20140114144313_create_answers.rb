class CreateAnswers < ActiveRecord::Migration
  def change
    create_table :answers do |t|
      t.boolean :correct
      t.string :answer
      t.references :question


      t.timestamps
    end
    add_index :answers, :question_id

  end
end
