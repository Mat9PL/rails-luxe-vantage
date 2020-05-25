class CreateRentals < ActiveRecord::Migration[6.0]
  def change
    create_table :rentals do |t|
      t.references :car, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.string :from
      t.string :to
      t.integer :total_price
      t.string :pickup_location

      t.timestamps
    end
  end
end
