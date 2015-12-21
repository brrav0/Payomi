class RemoveReferencesToAttachedFiles < ActiveRecord::Migration
  def change
    remove_reference :attached_files, :bankaccount, index: true
  end
end
