class AddNboflikesToRestaurant < ActiveRecord::Migration
  def change
    add_column :restaurants, :nboflikes, :integer
  end
end
