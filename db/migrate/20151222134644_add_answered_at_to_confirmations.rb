class AddAnsweredAtToConfirmations < ActiveRecord::Migration
  def change
    add_column :confirmations, :answered_at, :datetime
  end
end
