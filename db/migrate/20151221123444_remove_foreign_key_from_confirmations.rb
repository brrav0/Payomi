class RemoveForeignKeyFromConfirmations < ActiveRecord::Migration
  def change
    remove_foreign_key :attached_files, :confirmations
  end
end
