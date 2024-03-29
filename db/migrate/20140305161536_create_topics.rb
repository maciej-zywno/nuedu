class CreateTopics < ActiveRecord::Migration
  def change
    create_table :topics do |t|
      t.references :forum, index: true
      t.references :user, index: true
      t.string :title
      t.text :body

      t.timestamps
    end
  end
end
