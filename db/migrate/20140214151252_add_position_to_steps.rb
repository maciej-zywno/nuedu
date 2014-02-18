class AddPositionToSteps < ActiveRecord::Migration
  def change
    add_column :steps, :position, :integer
    add_index :steps, :position
  end
end
