class AddAnswerToBankaccounts < ActiveRecord::Migration
  def change
    add_column :bankaccounts, :answer, :string
  end
end
