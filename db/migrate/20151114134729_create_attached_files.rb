class CreateAttachedFiles < ActiveRecord::Migration
  def change
    create_table :attached_files do |t|
      t.string :name
      t.string :attachment
      t.boolean :signed_bank

      t.timestamps null: false
    end
  end
end
