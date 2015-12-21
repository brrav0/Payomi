class AddFileToConfirmation < ActiveRecord::Migration
  def change
    add_column :confirmations, :file, :string
  end
end
