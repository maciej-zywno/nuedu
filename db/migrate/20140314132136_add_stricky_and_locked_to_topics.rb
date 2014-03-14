class AddStickyAndLockedToTopics < ActiveRecord::Migration
  def change
    add_column :topics, :sticky, :boolean, default: false
    add_column :topics, :locked, :boolean, default: false
  end
end
