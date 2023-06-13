class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :offer, dependent: :destroy
  has_one :booking_status
  has_one :chatroom, dependent: :destroy
  has_one :review, dependent: :destroy
end

