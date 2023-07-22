FactoryBot.define do
  factory :sento_review do
    id {1}
    sento
    user
    comment { Faker::Lorem.characters(number: 10) }
    star {'star'}
  end
end