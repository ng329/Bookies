class CreateBookings < ActiveRecord::Migration[7.0]
  def change
    create_table :bookings do |t|
      t.references :user, null: false, foreign_key: true
      t.references :book, null: false, foreign_key: true
      t.datetime :rental_start
      t.datetime :rental_end
      t.float :total_price

      t.timestamps
    end
  end
end
