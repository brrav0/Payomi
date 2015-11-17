class AddIsBankToAttachedFiles < ActiveRecord::Migration
  def change
    add_column :attached_files, :is_bank, :boolean
  end
end
