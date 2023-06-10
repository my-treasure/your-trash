class RemovebookingFromChatroomsAndAddReferenceToBookings < ActiveRecord::Migration[7.0]
  def change
    remove_reference :chatrooms, :booking, foreign_key: true
    add_reference :chatrooms, :bookings, foreign_key: true
  end

end
