class DropTable < ActiveRecord::Migration
  def change
    drop_table :confirmations
  end
end
