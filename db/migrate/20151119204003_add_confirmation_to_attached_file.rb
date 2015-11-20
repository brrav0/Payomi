class AddConfirmationToAttachedFile < ActiveRecord::Migration
  def change
    add_column :attached_files, :confirmation, :integer
  end
end
