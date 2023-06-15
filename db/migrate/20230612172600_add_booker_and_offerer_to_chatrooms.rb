class AddBookerAndOffererToChatrooms < ActiveRecord::Migration[7.0]
  def change
    add_column :chatrooms, :booker_id, :bigint
    add_column :chatrooms, :offerer_id, :bigint

    add_foreign_key :chatrooms, :users, column: :booker_id
    add_foreign_key :chatrooms, :users, column: :offerer_id
  end
end
