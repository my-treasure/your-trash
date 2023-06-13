class DeleteReviweeIdFromReviews < ActiveRecord::Migration[7.0]
  def change
    remove_column :reviews, :reviewee_id
  end
end
