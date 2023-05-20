class AddColumnsToBookingStatuses < ActiveRecord::Migration[7.0]
  def change
    add_column :booking_statuses, :booking_id, :integer
  end
end
