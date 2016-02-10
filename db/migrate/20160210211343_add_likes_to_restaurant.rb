class AddLikesToRestaurant < ActiveRecord::Migration
  def change
    add_column :restaurants, :likes, :integer
  end
end
