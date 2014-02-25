class AddCompleteToStepProgresses < ActiveRecord::Migration
  def change
    add_column :step_progresses, :complete, :boolean, default: false
  end
end
