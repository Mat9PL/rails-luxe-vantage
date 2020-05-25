class CreateCars < ActiveRecord::Migration[6.0]
  def change
    create_table :cars do |t|
      t.string :brand
      t.string :model
      t.integer :year
      t.string :description
      t.string :horse_power
      t.integer :price
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
