class ChangeDataTypeInBookings < ActiveRecord::Migration[7.0]
  def change
    change_table :bookings do |t|
      t.change :rental_start, :date
      t.change :rental_end, :date
    end
  end
end
