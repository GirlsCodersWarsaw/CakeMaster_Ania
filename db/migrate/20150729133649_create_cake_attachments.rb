class CreateCakeAttachments < ActiveRecord::Migration
  def change
    create_table :cake_attachments do |t|
      t.integer :cake_id
      t.string :image

      t.timestamps null: false
    end
  end
end
