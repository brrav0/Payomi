class RemoveReferencesToAttachedFiles < ActiveRecord::Migration
  def change
    remove_reference :attached_files, :bankaccount, index: true, foreign_key: true
  end
end
