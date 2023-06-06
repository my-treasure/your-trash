class AddFollowedIdToFollow < ActiveRecord::Migration[7.0]
  def change
    add_column :follows, :followed_id, :integer
  end
end
