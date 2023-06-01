class AddCompletedStatustoBookingstatus < ActiveRecord::Migration[7.0]
  def change
    add_column :booking_statuses, :completed, :boolean
  end
end
