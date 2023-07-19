FactoryBot.define do
  factory :post do
    user
    prefecture_id {1}
    post_park_image {ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/app/assets/images/1e80cefbed8226738a100374efec915d.png"), filename:"sample-user3.jpg")}
    post_sento_image {ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/app/assets/images/1e80cefbed8226738a100374efec915d.png"), filename:"sample-user3.jpg")}
    park {Faker::Lorem.characters(number:10)}
    sento {Faker::Lorem.characters(number:10)}
    park_caption {Faker::Lorem.characters(number:10)}
    sento_caption {Faker::Lorem.characters(number:10)}
  end

end

