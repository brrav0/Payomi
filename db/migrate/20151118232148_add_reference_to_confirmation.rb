class AddReferenceToConfirmation < ActiveRecord::Migration
  def change
    add_column :confirmations, :reference, :string
  end
end
