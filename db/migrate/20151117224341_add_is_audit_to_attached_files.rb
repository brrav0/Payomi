class AddIsAuditToAttachedFiles < ActiveRecord::Migration
  def change
    add_column :attached_files, :is_audit, :boolean
  end
end
