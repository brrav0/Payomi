class CreateBankaccounts < ActiveRecord::Migration
  def change
    create_table :bankaccounts do |t|
      t.string :number
      t.string :currency
      t.decimal :balance
      t.integer :client_id
      t.integer :bank_id
      t.datetime :shared
      t.datetime :signed
      t.datetime :issued
      t.datetime :answered
      t.string :comments

      t.timestamps null: false
    end
  end
end
