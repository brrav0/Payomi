class AddReferencesToAttachedFiles < ActiveRecord::Migration
  def change
    add_reference :attached_files, :bankaccount, index: true, foreign_key: true
  end
end
