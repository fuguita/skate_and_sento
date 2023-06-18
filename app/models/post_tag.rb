class PostTag < ApplicationRecord

  has_many :post_post_tags, dependent: :destroy
  has_many :posts, through: :post_post_tags

end
