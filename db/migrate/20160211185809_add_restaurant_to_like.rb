class AddRestaurantToLike < ActiveRecord::Migration
  def change
    add_reference :likes, :restaurant, index: true, foreign_key: true
  end
end
