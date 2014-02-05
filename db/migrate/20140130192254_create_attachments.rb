class CreateAttachments < ActiveRecord::Migration
  def change
    create_table :attachments do |t|
      t.string :title
      t.string :url
      t.string :unique_id
      t.string :s3_filepath
      t.text :description
      t.attachment :file
      t.boolean :processed, default: false, null: false
      t.integer :attachable_id
      t.string  :attachable_type
      t.timestamps
    end
  end
end
