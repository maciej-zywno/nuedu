class AddPositionToVideos < ActiveRecord::Migration
  def change
    add_column :videos, :position, :integer
    add_index :videos, [:position, :step_id], unique: true
  end
end
