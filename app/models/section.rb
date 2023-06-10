class Section < ApplicationRecord
  has_many :park_sections
  has_many :parks, through: :park_sections
end
