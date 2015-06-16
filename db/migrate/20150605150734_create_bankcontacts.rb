class CreateBankcontacts < ActiveRecord::Migration
  def change
    create_table :bankcontacts do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.integer :bank_id

      t.timestamps null: false
    end
  end
end
