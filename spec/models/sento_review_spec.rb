require "rails_helper"

RSpec.describe SentoReview, "sento_reviewに関するテスト", type: :model do
  describe "SENTO_REVIEWモデルのテスト" do
    subject(:sento_review) { build(:sento_review) }

    context "commentカラム" do
      it "空欄でないこと、エラーメッセージが返される" do
        sento_review.comment = ""
        expect(sento_review).to be_invalid
        expect(sento_review.errors[:comment]).to include("を入力してください")
      end
      it "5文字以上であること：4文字はx、エラーメッセージが返ってくるか" do
        sento_review.comment = Faker::Lorem.characters(number: 4)
        expect(sento_review).to be_invalid
        expect(sento_review.errors[:comment]).to include("は5文字以上で入力してください")
      end
      it "5文字以上であること：5文字は○" do
        sento_review.comment = Faker::Lorem.characters(number: 5)
        expect(sento_review).to be_valid
      end
      it "200文字以下であること：200文字は○" do
        sento_review.comment = Faker::Lorem.characters(number: 200)
        expect(sento_review).to be_valid
      end
      it "200文字以下であること：201文字はx" do
        sento_review.comment = Faker::Lorem.characters(number: 201)
        expect(sento_review).not_to be_valid
        expect(sento_review.errors[:comment]).to include("は200文字以内で入力してください")
      end
    end
    context "starカラム" do
      it "空欄でないこと、エラーメッセージが返される" do
        sento_review.star = ""
        expect(sento_review).to be_invalid
        expect(sento_review.errors[:star]).to include ("を入力してください")
      end
    end
  end
end
