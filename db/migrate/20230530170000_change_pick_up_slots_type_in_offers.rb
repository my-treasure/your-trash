class ChangePickUpSlotsTypeInOffers < ActiveRecord::Migration[7.0]
  def change
    change_column :offers, :pickupslots, :string
  end
end
