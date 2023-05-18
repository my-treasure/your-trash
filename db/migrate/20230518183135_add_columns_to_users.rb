class AddColumnsToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :username, :text
    add_column :users, :info, :text
  end
end
