class DropBankcontacts < ActiveRecord::Migration
  def change
    drop_table :bankcontacts
  end
end
