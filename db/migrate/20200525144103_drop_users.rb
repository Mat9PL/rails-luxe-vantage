class DropUsers < ActiveRecord::Migration[6.0]
  def change
    drop_table :rentals
    drop_table :cars
    drop_table :users
    create_table :cars do |t|
      t.string :column_name
      t.string :model
      t.integer :year
      t.string :description
      t.string :horse_power
      t.integer :price
    
      t.timestamps
    end
    
  end
end
