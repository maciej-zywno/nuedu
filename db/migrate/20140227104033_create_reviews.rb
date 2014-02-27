class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.text :content
      t.references :user, index: true
      t.references :course, index: true
      t.integer :stars
      t.string :status, index:true

      t.timestamps
    end
  end
end
