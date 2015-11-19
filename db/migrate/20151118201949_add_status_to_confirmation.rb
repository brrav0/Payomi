class AddStatusToConfirmation < ActiveRecord::Migration
  def change
    add_column :confirmations, :status, :string
  end
end
