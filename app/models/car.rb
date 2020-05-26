class Car < ApplicationRecord
  belongs_to :user
  has_many :rentals
  has_many_attached :photos
end
