class RemoveOfferImageFromOffers < ActiveRecord::Migration[7.0]
  def change
    remove_column :offers, :offer_image, :text
  end
end
