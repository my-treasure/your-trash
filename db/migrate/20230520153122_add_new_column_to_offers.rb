class AddNewColumnToOffers < ActiveRecord::Migration[7.0]
  def change
    add_column :offers, :allergen, :boolean
  end
end
