class ParkReview < ApplicationRecord
  belongs_to :park
  belongs_to :user

  validates :comment, presence:true, length: { minimum: 5, maximum: 200 }

end
