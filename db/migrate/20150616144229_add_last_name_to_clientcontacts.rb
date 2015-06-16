class AddLastNameToClientcontacts < ActiveRecord::Migration
  def change
    add_column :clientcontacts, :last_name, :string
  end
end
