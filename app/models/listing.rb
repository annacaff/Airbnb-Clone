class Listing < ApplicationRecord
  belongs_to :user, foreign_key: :owner_id
  has_many :bookings
end
