class ChangeStepDescriptionType < ActiveRecord::Migration
  def change
    change_column :steps, :description, :text
  end
end
