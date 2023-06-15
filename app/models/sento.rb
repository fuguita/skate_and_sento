class Sento < ApplicationRecord

  has_many :park_sentos, dependent: :destroy
  has_many :parks, through: :park_sentos
  has_many :sento_favorites, dependent: :destroy
  has_many :users, through: :sento_favorites
  has_many :sento_sento_tags, dependent: :destroy
  has_many :sento_tags, through: :sento_sento_tags

  enum prefecture_id:{
     "エリアを選択":0,
     大阪:1,京都:2
   }

   validates :name, presence: true
   validates :prefecture_id, presence: true
   validates :introduction, presence: true
   validates :address, presence: true
   VALID_POSTAL_CODE_REGEX = /\A\d{3}[-]\d{4}\z/
   validates :postal_code, presence: true, format: { with: VALID_POSTAL_CODE_REGEX }
   validates :telephone_number, presence: true
   validates :business_hour, presence: true
   validates :temperature, presence: true
   validates :towel, presence: true
   validates :soap, presence: true

  has_many_attached :sento_images

  def get_first_sento_image
      (sento_images.attached?) ? sento_images.first : 'default-image.jpg'
  end

  def active_status
      if is_active == true
        return '掲載中'
      else
        return '掲載停止中'
      end
  end

  def sauna_status
      if sauna == true
        return 'あり'
      else
        return 'なし'
      end
  end

  def open_air_bath_status
      if open_air_bath == true
        return 'あり'
      else
        return 'なし'
      end
  end

  def cold_bath_status
    if cold_bath == true
      return 'あり'
    else
      return 'なし'
    end
  end

  def self.search_for(word)
      Sento.where('name LIKE ?', '%'+word+'%')
  end
  
  def sento_favorited_by?(user)
    sento_favorites.exists?(user_id: user.id)
  end  

end
