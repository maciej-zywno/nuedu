class CreateForums < ActiveRecord::Migration
  def change
    create_table :forums do |t|
      t.string :state
      t.references :course, index: true

      t.timestamps
    end
  end
end
