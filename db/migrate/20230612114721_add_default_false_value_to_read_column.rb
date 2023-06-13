class AddDefaultFalseValueToReadColumn < ActiveRecord::Migration[7.0]
  def change
    change_column :messages, :read, :boolean, default: 'false'
  end
end
