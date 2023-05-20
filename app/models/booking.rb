class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :offer
  has_one :booking_status
end
