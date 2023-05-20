class RemoveColumnAllergenglutenFromOffers < ActiveRecord::Migration[7.0]
  def change
    remove_column :offers, :allergengluten, :boolean
    remove_column :offers, :allergenfish, :boolean
    remove_column :offers, :allergennuts, :boolean
    remove_column :offers, :allergenother, :boolean
  end
end
