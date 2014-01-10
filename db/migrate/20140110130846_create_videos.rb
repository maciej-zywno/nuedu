class CreateVideos < ActiveRecord::Migration
  def change
    create_table :videos do |t|
      t.string :title
      t.string :description
      t.string :yt_id
      t.boolean :complete

      t.timestamps
    end
  end
end
