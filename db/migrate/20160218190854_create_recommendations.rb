class CreateRecommendations < ActiveRecord::Migration
  def change
    create_table :recommendations do |t|
      t.references :user, index: true, foreign_key: true
      t.references :restaurant, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
