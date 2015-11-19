class CreateConfirmations < ActiveRecord::Migration
  def change
    create_table :confirmations do |t|
      t.references :client, index: true, foreign_key: true
      t.references :bank, index: true, foreign_key: true
      t.references :status, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
