class ModifyReviewConstrains < ActiveRecord::Migration[7.0]
  def change
    remove_foreign_key :reviews, :bookings
    add_foreign_key :reviews, :bookings, on_delete: :cascade
  end
end
