class RemoveFirstNameFromClientcontacts < ActiveRecord::Migration
  def change
    remove_column :clientcontacts, :First_name, :string
  end
end
