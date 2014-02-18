class AddPositionToVideos < ActiveRecord::Migration
  def change
    add_column :videos, :position, :integer
    add_index :videos, :position, unique: true
  end
end
