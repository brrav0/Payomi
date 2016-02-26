class RemoveRestaurantFromSave < ActiveRecord::Migration
  def change
    remove_column :saves, :restaurant_id
  end
end
