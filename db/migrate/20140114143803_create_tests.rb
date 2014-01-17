class CreateTests < ActiveRecord::Migration
  def change
    create_table :tests do |t|
      t.string :name
      t.references :step

      t.timestamps
    end
    add_index :tests, :step_id

  end
end
