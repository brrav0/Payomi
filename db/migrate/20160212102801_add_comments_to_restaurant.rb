class AddCommentsToRestaurant < ActiveRecord::Migration
  def change
    add_column :restaurants, :comments, :string
  end
end
