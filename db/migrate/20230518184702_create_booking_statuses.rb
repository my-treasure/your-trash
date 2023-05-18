class CreateBookingStatuses < ActiveRecord::Migration[7.0]
  def change
    create_table :booking_statuses do |t|
      t.boolean :accepted

      t.timestamps
    end
  end
end
