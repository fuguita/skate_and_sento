class Sento < ApplicationRecord
  enum prefecture_id:{
     "エリアを選択":0,
     大阪:1,京都:2
   }

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



end
