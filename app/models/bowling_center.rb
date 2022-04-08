class BowlingCenter < ApplicationRecord
  has_many :scores

  geocoded_by :address
  after_validation :geocode, if: :address_changed?
end
