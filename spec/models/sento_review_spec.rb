require 'rails_helper'

RSpec.describe SentoReview, "sento_reviewに関するテスト", type: :model do
  describe 'SENTO_REVIEWモデルのテスト' do
    subject { sento_review.valid? }

    let (:sento_review) { build(:sento_review)}

    context 'commentカラム' do
      it '空欄でないこと、エラーメッセージが返される' do
        sento_review.comment = ''
        is_expected.to eq false
        expect(sento_review.errors[:comment]).to include ("を入力してください")
      end
      it '5文字以上であること：4文字はx、エラーメッセージが返ってくるか' do
        sento_review.comment = Faker::Lorem.characters(number: 4)
        is_expected.to eq false
        expect(sento_review.errors[:comment]).to include ("は5文字以上で入力してください")
      end
      it '5文字以上であること：5文字は○' do
        sento_review.comment = Faker::Lorem.characters(number: 5)
        is_expected.to eq true
      end
      it '200文字以下であること：200文字は○' do
        sento_review.comment = Faker::Lorem.characters(number: 200)
        is_expected.to eq true
      end
      it '200文字以下であること：201文字はx' do
        sento_review.comment = Faker::Lorem.characters(number: 201)
        is_expected.to eq false
        expect(sento_review.errors[:comment]).to include ("は200文字以内で入力してください")
      end
    end
    context 'starカラム' do
      it '空欄でないこと、エラーメッセージが返される' do
        sento_review.star = ''
        is_expected.to eq false
        expect(sento_review.errors[:star]).to include ("を入力してください")
      end
    end
  end
end