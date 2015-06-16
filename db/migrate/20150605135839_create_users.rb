class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :password_digest
      t.boolean :admin
      t.string :activation_digest
      t.boolean :activated
      t.datetime :activated_at
      t.string :remember_digest
      t.string :reset_digest
      t.datetime :reset_sent_at
      t.boolean :clientcontact
      t.boolean :bankcontact

      t.timestamps null: false
    end
  end
end
