class AddReferencesToAttachedFiles < ActiveRecord::Migration
  def change
    add_reference :attached_files, :confirmation, index: true
  end
end
