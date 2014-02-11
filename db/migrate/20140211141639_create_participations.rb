class CreateParticipations < ActiveRecord::Migration
  def change
    create_table :participations do |t|
      t.references :user, index: true
      t.references :course, index: true
      t.string :status

      t.timestamps
    end
  end
end
