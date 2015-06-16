class AddEmailToClientcontact < ActiveRecord::Migration
  def change
    add_column :clientcontacts, :email, :string
  end
end
