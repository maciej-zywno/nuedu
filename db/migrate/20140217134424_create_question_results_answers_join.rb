class CreateQuestionResultsAnswersJoin < ActiveRecord::Migration
  def change
    create_table :answers_question_results do |t|
      t.integer :answer_id
      t.integer :question_result_id
    end
    add_index :answers_question_results, [:answer_id, :question_result_id], name: 'q_r_a_index'

  end
end
