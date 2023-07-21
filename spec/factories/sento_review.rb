FactoryBot.define do
  factory :sento_review do
    comment { Faker::Lorem.characters(number: 10) }
    star {'star'}
  end
end