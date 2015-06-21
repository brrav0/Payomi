class CreateAccountingfirms < ActiveRecord::Migration
  def change
    create_table :accountingfirms do |t|
      t.string :name
      t.string :number_and_street
      t.string :zip_code
      t.string :city

      t.timestamps null: false
    end
  end
end
