require "rails_helper"

RSpec.describe Park, "Parkモデルに関するテスト", type: :model do
  describe "PARKモデルのテスト" do
    subject { park.valid? }

    let(:park) { build (:park) }

    context "空白のバリデーション" do
      it "prefecture_idカラム" do
        park = FactoryBot.build(:park)
        park.prefecture_id = 0
        expect(park).to be_invalid
        expect(park.errors[:prefecture_id]).to include("を選択して下さい")
      end
      it "nameが空白の場合にバリデーションチェックされ空白に対してエラーメッセージが返ってきているか" do
        park.name = ""
        is_expected.to eq false
        expect(park.errors[:name]).to include("を入力してください")
      end
      it "introductionが空白の場合にバリデーションチェックされ空白に対してエラーメッセージが返ってきているか" do
        park.introduction = ""
        is_expected.to eq false
        expect(park.errors[:introduction]).to include("を入力してください")
      end
      it "addressが空白の場合にバリデーションチェックされ空白に対してエラーメッセージが返ってきているか" do
        park.address = ""
        is_expected.to eq false
        expect(park.errors[:address]).to include("を入力してください")
      end
      it "postal_codeが空白の場合にバリデーションチェックされ空白に対してエラーメッセージが返ってきているか" do
        park.postal_code = ""
        is_expected.to eq false
        expect(park.errors[:postal_code]).to include("を入力してください")
      end
      it "business_hourが空白の場合にバリデーションチェックされ空白に対してエラーメッセージが返ってきているか" do
        park.business_hour = ""
        is_expected.to eq false
        expect(park.errors[:business_hour]).to include("を入力してください")
      end
      it "holidayが空白の場合にバリデーションチェックされ空白に対してエラーメッセージが返ってきているか" do
        park.holiday = ""
        is_expected.to eq false
        expect(park.errors[:holiday]).to include("を入力してください")
      end
      it "telephone_numberが空白の場合にバリデーションチェックされ空白に対してエラーメッセージが返ってきているか" do
        park.telephone_number = ""
        is_expected.to eq false
        expect(park.errors[:telephone_number]).to include("を入力してください")
      end
      it "priceが空白の場合にバリデーションチェックされ空白に対してエラーメッセージが返ってきているか" do
        park.price = ""
        is_expected.to eq false
        expect(park.errors[:price]).to include("を入力してください")
      end
      it "parkingが空白の場合にバリデーションチェックされ空白に対してエラーメッセージが返ってきているか" do
        park.parking = ""
        is_expected.to eq false
        expect(park.errors[:parking]).to include("を入力してください")
      end
      it "helmetが空白の場合にバリデーションチェックされ空白に対してエラーメッセージが返ってきているか" do
        park.helmet = ""
        is_expected.to eq false
        expect(park.errors[:helmet]).to include("を入力してください")
      end
    end
  end
end
