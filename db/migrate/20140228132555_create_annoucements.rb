class CreateAnnoucements < ActiveRecord::Migration
  def change
    create_table :annoucements do |t|
      t.references :course, index: true
      t.references :user, index: true
      t.string :title
      t.text :content

      t.timestamps
    end
  end
end
