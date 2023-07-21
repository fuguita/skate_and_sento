class ParkReview < ApplicationRecord
  belongs_to :park
  belongs_to :user

  scope :star_count, -> {order(star: :desc)}

  validates :comment, presence: true, length: { in: 5..200 }
  validates :star, presence: true

end
