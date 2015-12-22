class AddFileAnswerToConfirmations < ActiveRecord::Migration
  def change
    add_column :confirmations, :file_answer, :string
  end
end
