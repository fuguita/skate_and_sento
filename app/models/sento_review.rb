class SentoReview < ApplicationRecord
  belongs_to :sento
  belongs_to :user

  validates :comment, presence:true, length: { minimum: 5, maximum: 200 }
  validates :star, presence:true



end
