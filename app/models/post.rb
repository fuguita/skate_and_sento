class Post < ApplicationRecord
  belongs_to :user
  has_many :likes, dependent: :destroy
  has_many :post_comments, dependent: :destroy
  has_many :post_post_tags, dependent: :destroy
  has_many :post_tags, through: :post_post_tags

  validates :prefecture_id, presence: { message: "を選択してください" }
  validates :post_park_image, presence: { message: "を選択してください" }
  validates :post_sento_image, presence: { message: "を選択してください" }
  validates :park, presence: true
  validates :sento, presence: true
  validates :park_caption, presence: true
  validates :sento_caption, presence: true

  enum prefecture_id: {
     北海道: 1, 青森県: 2, 岩手県: 3, 宮城県: 4, 秋田県: 5, 山形県: 6, 福島県: 7,
     茨城県: 8, 栃木県: 9, 群馬県: 10, 埼玉県: 11, 千葉県: 12, 東京都: 13, 神奈川県: 14,
     新潟県: 15, 富山県: 16, 石川県: 17, 福井県: 18, 山梨県: 19, 長野県: 20,
     岐阜県: 21, 静岡県: 22, 愛知県: 23, 三重県: 24,
     滋賀県: 25, 京都府: 26, 大阪府: 27, 兵庫県: 28, 奈良県: 29, 和歌山県: 30,
     鳥取県: 31, 島根県: 32, 岡山県: 33, 広島県: 34, 山口県: 35,
     徳島県: 36, 香川県: 37, 愛媛県: 38, 高知県: 39,
     福岡県: 40, 佐賀県: 41, 長崎県: 42, 熊本県: 43, 大分県: 44, 宮崎県: 45, 鹿児島県: 46,
     沖縄県: 47
   }

  has_one_attached :post_park_image
  has_one_attached :post_sento_image

  def get_post_park_image
    (post_park_image.attached?) ? post_park_image : "default-image.jpg"
  end

  def get_post_sento_image
    (post_sento_image.attached?) ? post_sento_image : "default-image.jpg"
  end

  def liked_by?(user)
    likes.exists?(user_id: user.id)
  end
end
