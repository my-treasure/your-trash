class Review < ApplicationRecord
  belongs_to :booking, dependent: :destroy
  belongs_to :reviewer, class_name: "User"
  belongs_to :reviewee, class_name: "User"
end
