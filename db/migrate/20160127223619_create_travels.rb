class CreateTravels < ActiveRecord::Migration
  def change
    create_table :travels do |t|
      t.string :firstname
      t.string :lastname
      t.string :whatsapp
      t.string :email
      t.string :from
      t.string :to
      t.string :pickuptime

      t.timestamps null: false
    end
  end
end
