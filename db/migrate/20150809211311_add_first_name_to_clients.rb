class AddFirstNameToClients < ActiveRecord::Migration
  def change
    add_column :clients, :first_name, :string
  end
end
