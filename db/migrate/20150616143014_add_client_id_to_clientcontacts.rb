class AddClientIdToClientcontacts < ActiveRecord::Migration
  def change
    add_column :clientcontacts, :client_id, :integer
  end
end
