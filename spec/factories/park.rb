FactoryBot.define do
  factory :park do
    park_image {ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/app/assets/images/1e80cefbed8226738a100374efec915d.png"), filename:"sample-user3.jpg")}
    name '大阪パーク'
    introduction 'パークコメント'
    address {Faker::Lorem.characters(number:15)}
    postal_code {123-4567}
    business_hour '月曜日'
    telephone_number　'123456789'
    price '100円'
    parking 'あり'
    helmet　'あり'
    park_tag_ids {1}
  end
end