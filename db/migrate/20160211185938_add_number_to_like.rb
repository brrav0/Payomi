class AddNumberToLike < ActiveRecord::Migration
  def change
    add_column :likes, :number, :integer
  end
end
