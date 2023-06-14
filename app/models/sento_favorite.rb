class SentoFavorite < ApplicationRecord
  belongs_to :user
  belongs_to :sento
end
