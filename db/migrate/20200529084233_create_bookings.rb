class CreateBookings < ActiveRecord::Migration[6.0]
  def change
    create_table :bookings do |t|
      t.references :car, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.datetime :from
      t.datetime :to
      t.integer :total_price

      t.timestamps
    end
  end
end
