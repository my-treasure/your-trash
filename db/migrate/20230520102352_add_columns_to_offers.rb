class AddColumnsToOffers < ActiveRecord::Migration[7.0]
  def change
    add_column :offers, :longitude, :float
    add_column :offers, :latitude, :float
    add_column :offers, :pickupslots, :datetime
    add_column :offers, :typeofoffer, :string
    add_column :offers, :foodtype, :string
    add_column :offers, :allergengluten, :boolean
    add_column :offers, :allergennuts, :boolean
    add_column :offers, :allergenfish, :boolean
    add_column :offers, :allergenother, :boolean
  end
end
