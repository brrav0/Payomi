class RemoveLastNameFromClientcontacts < ActiveRecord::Migration
  def change
    remove_column :clientcontacts, :Last_name, :string
  end
end
