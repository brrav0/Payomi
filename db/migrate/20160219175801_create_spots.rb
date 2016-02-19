class CreateSpots < ActiveRecord::Migration
  def change
    create_table :spots do |t|
      t.string :name
      t.string :city

      t.timestamps null: false
    end
  end
end
