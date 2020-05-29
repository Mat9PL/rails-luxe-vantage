class Car < ApplicationRecord
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
  
  belongs_to :user
  has_many :rentals
  has_many_attached :photos

  include PgSearch::Model
  pg_search_scope :search_by_model_and_brand,
    against: [ :model, :brand ],
    using: {
      tsearch: { prefix: true } # <-- now `superman batm` will return something!
    }
end
