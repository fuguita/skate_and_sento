class ParkParkTag < ApplicationRecord
  belongs_to :park
  belongs_to :park_tag
end
