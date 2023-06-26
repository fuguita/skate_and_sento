class Park < ApplicationRecord

  has_many :park_sections,dependent: :destroy
  has_many :sections, through: :park_sections
  has_many :park_sentos, dependent: :destroy
  has_many :sentos, through: :park_sentos
  has_many :park_favorites, dependent: :destroy
  has_many :users, through: :park_favorites
  has_many :park_park_tags, dependent: :destroy
  has_many :park_tags, through: :park_park_tags
  has_many :park_reviews, dependent: :destroy


  enum prefecture_id:{
     "エリアを選択":0,
     大阪:1,京都:2
   }

   scope :star_count, -> {order(star: :desc)}

   validates :name, presence: true
   validates :prefecture_id, presence: true
   validates :introduction, presence: true
   validates :address, presence: true
   VALID_POSTAL_CODE_REGEX = /\A\d{3}[-]\d{4}\z/
   validates :postal_code, presence: true, format: { with: VALID_POSTAL_CODE_REGEX }
   validates :telephone_number, presence: true
   validates :business_hour, presence: true
   validates :helmet, presence: true


  has_many_attached :park_images

  def active_status
      if is_active == true
        return '掲載中'
      else
        return '掲載停止中'
      end
  end

  def self.search_for(word)
    Park.where('name LIKE ?', '%'+word+'%')
  end

  def park_favorited_by?(user)
    park_favorites.exists?(user_id: user.id)
  end


end
