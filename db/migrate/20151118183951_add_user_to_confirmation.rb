class AddUserToConfirmation < ActiveRecord::Migration
  def change
    add_reference :confirmations, :user, index: true, foreign_key: true
  end
end
