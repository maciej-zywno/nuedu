class AddTopicsCountToForums < ActiveRecord::Migration
  def change
    add_column :forums, :topics_count, :integer, default: 0
  end
end
