class BookingStatus < ApplicationRecord
  belongs_to :booking, dependent: :destroy
end
