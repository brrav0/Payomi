class AddEmailToBank < ActiveRecord::Migration
  def change
    add_column :banks, :email, :string
  end
end
