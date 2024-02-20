class Booking < ApplicationRecord
  belongs_to :listing
  belongs_to :user
  has_many :reviews
end
