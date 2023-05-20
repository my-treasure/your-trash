class AddOtherColumnsToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :address, :string
    add_column :users, :longitude, :float
    add_column :users, :lattitute, :float
    add_column :users, :role, :string
  end
end
