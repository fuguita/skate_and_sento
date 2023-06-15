class SentoTag < ApplicationRecord
 has_many :sento_sento_tags, dependent: :destroy
 has_many :sentos, through: :sento_sento_tags

 validates :name, presence: true
end
