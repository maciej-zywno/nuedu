class AddPostionToVideos < ActiveRecord::Migration
  def change
    add_column :videos, :postion, :integer
    add_index :videos, :postion, unique: true
  end
end
