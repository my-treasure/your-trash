class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :offers
  # has_many :reviews
  has_many :followers
  has_many :chatrooms
  has_many :messages
  has_many :bookings
  has_one_attached :profile_picture

  has_many :reviews, foreign_key: :reviewer_id
  has_many :received_reviews, foreign_key: :reviewee_id, class_name: "Review"
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
end
