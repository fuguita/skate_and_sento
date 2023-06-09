class Sento < ApplicationRecord
  enum prefecture_id:{
     "エリアを選択":0,
     大阪:1,京都:2
   }
end

has_many_attached :sento_image

def get_sento_image
    (sento_image.attached?) ? sento_image : 'default-image.jpg'
end
