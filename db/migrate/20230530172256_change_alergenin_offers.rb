class ChangeAlergeninOffers < ActiveRecord::Migration[7.0]
  def change
    change_column :offers, :allergen, :string

  end
end
