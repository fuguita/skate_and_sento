class ParkTag < ApplicationRecord

  has_many :park_park_tags, dependent: :destroy
  has_many :parks, through: :park_park_tags

  validates :name, presence: true

end
