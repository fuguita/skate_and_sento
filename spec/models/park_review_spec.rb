require 'rails_helper'

RSpec.describe ParkReview, "park_reviewに関するテスト", type: :model do
  describe 'PARK_REVIEWモデルのテスト' do
    subject(:park_review) { build(:park_review) }

    context 'commentカラム' do
      it '空欄でないこと、エラーメッセージが返される' do
        park_review.comment = ''
        expect(park_review).not_to be_valid
        expect(park_review.errors[:comment]).to include("を入力してください")
      end
      it '5文字以上であること：4文字はx、エラーメッセージが返ってくるか' do
        park_review.comment = Faker::Lorem.characters(number: 4)
        expect(park_review).not_to be_valid
        expect(park_review.errors[:comment]).to include("は5文字以上で入力してください")
      end
      it '5文字以上であること：5文字は○' do
        park_review.comment = Faker::Lorem.characters(number: 5)
        expect(park_review).to be_valid
      end
      it '200文字以下であること：200文字は○' do
        park_review.comment = Faker::Lorem.characters(number: 200)
        expect(park_review).to be_valid
      end
      it '200文字以下であること：201文字はx' do
        park_review.comment = Faker::Lorem.characters(number: 201)
        expect(park_review).not_to be_valid
        expect(park_review.errors[:comment]).to include("は200文字以内で入力してください")
      end
    end
    context 'starカラム' do
      it '空欄でないこと、エラーメッセージが返される' do
        park_review.star = ''
        expect(park_review).not_to be_valid
        expect(park_review.errors[:star]).to include ("を入力してください")
      end
    end
  end
end