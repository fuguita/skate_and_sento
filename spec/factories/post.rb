FactoryBot.define do
  factory :post do
    # prefecture_id {Faker::Lorem.characters(number:10)}
    # post_park_image {Faker::Lorem.characters(number:10)}
    # post_sento_image {Faker::Lorem.characters(number:10)}
    park {Faker::Lorem.characters(number:10)}
    sento {Faker::Lorem.characters(number:10)}
    park_caption {Faker::Lorem.characters(number:10)}
    sento_caption {Faker::Lorem.characters(number:10)}
  end

end

