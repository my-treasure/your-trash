class ChangePickUpTimeInBookings < ActiveRecord::Migration[7.0]
  def change
    change_column :bookings, :pick_up_time, :string
  end
end
