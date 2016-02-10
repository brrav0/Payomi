class DropPaintings < ActiveRecord::Migration
  def change
    drop_table :paintings
  end
end
