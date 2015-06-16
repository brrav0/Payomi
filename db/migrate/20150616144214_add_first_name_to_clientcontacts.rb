class AddFirstNameToClientcontacts < ActiveRecord::Migration
  def change
    add_column :clientcontacts, :first_name, :string
  end
end
