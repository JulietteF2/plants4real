class CreateBookings < ActiveRecord::Migration[5.2]
  def change
    create_table :bookings do |t|
      t.references :plant, foreign_key: true
      t.references :user, foreign_key: true
      t.string :status
      t.datetime :start_date
      t.datetime :end_date
      t.float :total_price

      t.timestamps
    end
  end
end
