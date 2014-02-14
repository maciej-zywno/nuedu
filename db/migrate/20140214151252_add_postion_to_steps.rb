class AddPostionToSteps < ActiveRecord::Migration
  def change
    add_column :steps, :positon, :integer
    add_index :steps, :positon
  end
end
