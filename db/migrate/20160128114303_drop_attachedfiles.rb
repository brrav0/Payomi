class DropAttachedfiles < ActiveRecord::Migration
  def change
    drop_table :attached_files
  end
end
