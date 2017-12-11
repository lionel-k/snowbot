class Domain < ApplicationRecord
  geocoded_by :name
  after_validation :geocode, if: :name_changed?
  has_many :offers
end
