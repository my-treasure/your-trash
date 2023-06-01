class AddReviewerAndRevieweeToReviews < ActiveRecord::Migration[7.0]
  def change
    add_reference :reviews, :reviewer, foreign_key: { to_table: :users }
    add_reference :reviews, :reviewee, foreign_key: { to_table: :users }
  end
end
