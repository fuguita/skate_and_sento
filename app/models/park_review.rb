class ParkReview < ApplicationRecord
  belongs_to :park
  belongs_to :user

  scope :star_count, -> {order(star: :desc)}

  validates :comment, presence:true, length: { minimum: 5, maximum: 200 }
  validates :star, presence:true

end
