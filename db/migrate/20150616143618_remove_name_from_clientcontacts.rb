class RemoveNameFromClientcontacts < ActiveRecord::Migration
  def change
    remove_column :clientcontacts, :name, :string
  end
end
