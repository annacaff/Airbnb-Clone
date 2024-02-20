class Review < ApplicationRecord
  belongs_to :booking
  belongs_to :reviewer, class_name: 'User'
end
