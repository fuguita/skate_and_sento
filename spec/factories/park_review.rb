FactoryBot.define do
  factory :park_review do
    comment { Faker::Lorem.characters(number: 10) }
    star {'star'}
  end
end