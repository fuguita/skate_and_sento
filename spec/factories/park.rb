FactoryBot.define do
  factory :park do
    id { 1 }
    prefecture_id { 1 }
    name { "大阪パーク" }
    introduction { "パークコメント" }
    address { Faker::Lorem.characters(number: 15) }
    postal_code { 123 - 4567 }
    business_hour { "月曜日" }
    holiday { "月曜日" }
    telephone_number { "123456789" }
    price { "100円" }
    parking { "あり" }
    helmet { "あり" }
    # park_tag_ids {1}
  end
end
