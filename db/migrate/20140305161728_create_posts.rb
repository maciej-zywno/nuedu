class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.references :topic, index: true
      t.references :user, index: true
      t.text :body

      t.timestamps
    end
  end
end
