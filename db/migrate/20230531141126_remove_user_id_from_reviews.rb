class RemoveUserIdFromReviews < ActiveRecord::Migration[7.0]
  def change
    remove_index :reviews, :user_id
    remove_column :reviews, :user_id, :bigint, null: false
  end
end
