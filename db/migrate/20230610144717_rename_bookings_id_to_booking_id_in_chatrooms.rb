class RenameBookingsIdToBookingIdInChatrooms < ActiveRecord::Migration[7.0]
  def change
    rename_column :chatrooms, :bookings_id, :booking_id
  end
end
