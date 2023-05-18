class CreateOffers < ActiveRecord::Migration[7.0]
  def change
    create_table :offers do |t|
      t.text :title
      t.text :body
      t.references :user, null: false, foreign_key: true
      t.text :address
      t.text :offer_image

      t.timestamps
    end
  end
end
