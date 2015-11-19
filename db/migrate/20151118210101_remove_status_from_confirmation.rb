class RemoveStatusFromConfirmation < ActiveRecord::Migration
  def change
    remove_reference :confirmations, :status, index: true, foreign_key: true
  end
end
