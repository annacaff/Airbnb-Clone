class User < ApplicationRecord
  has_many :listings, foreign_key: :owner_id
  has_many :bookings
  has_many :reviews, foreign_key: :reviewer_id
  has_secure_password
end
