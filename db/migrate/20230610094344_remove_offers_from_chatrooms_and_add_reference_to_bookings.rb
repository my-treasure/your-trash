class RemoveOffersFromChatroomsAndAddReferenceToBookings < ActiveRecord::Migration[7.0]
  def change
    remove_reference :chatrooms, :offers, foreign_key: true
    add_reference :chatrooms, :booking, foreign_key: true
  end
end
