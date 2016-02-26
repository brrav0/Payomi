class AddSpotToSave < ActiveRecord::Migration
  def change
    add_reference :saves, :spot, index: true, foreign_key: true
  end
end
