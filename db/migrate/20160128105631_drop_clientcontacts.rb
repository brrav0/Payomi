class DropClientcontacts < ActiveRecord::Migration
  def change
    drop_table :clientcontacts
  end
end
