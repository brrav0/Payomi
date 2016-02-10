class DropBankaccounts < ActiveRecord::Migration
  def change
    drop_table :bankaccounts
  end
end
