class RemoveLastnameFromTravel < ActiveRecord::Migration
  def change
    remove_column :travels, :lastname
  end
end
