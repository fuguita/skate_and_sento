class Sento < ApplicationRecord
  enum prefecture_id:{
     "エリアを選択":0,
     大阪:1,京都:2
   }

  has_many_attached :sento_image

  def get_sento_image
      (sento_image.attached?) ? sento_image : 'default-image.jpg'
  end

  def active_status
      if is_active == true
        return '掲載中'
      else
        return '掲載停止中'
      end
  end


end
