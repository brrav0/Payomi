class CreateClientcontacts < ActiveRecord::Migration
  def change
    create_table :clientcontacts do |t|
      t.string :name
      t.string :number_and_street
      t.string :zip_code
      t.string :city
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
