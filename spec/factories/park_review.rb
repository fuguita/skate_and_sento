FactoryBot.define do
  factory :park_review do
    id {1}
    park
    user
    comment { Faker::Lorem.characters(number: 10) }
    star {'star'}
  end
end