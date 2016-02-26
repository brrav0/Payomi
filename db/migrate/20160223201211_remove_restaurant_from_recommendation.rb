class RemoveRestaurantFromRecommendation < ActiveRecord::Migration
  def change
    remove_column :recommendations, :restaurant_id
  end
end
