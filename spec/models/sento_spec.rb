require 'rails_helper'

RSpec.describe Sento, "Sentoモデルに関するテスト", type: :model do
  describe 'SENTOモデルのテスト' do
    subject { sento.valid? }

    let(:sento) { build (:sento)}

      context '空白のバリデーション' do
        it 'prefecture_idカラム' do
           sento = FactoryBot.build(:sento)
           sento.prefecture_id = 0
           expect(sento).to be_invalid
           expect(sento.errors[:prefecture_id]).to include("を選択して下さい")
        end
        it "nameが空白の場合にバリデーションチェックされ空白に対してエラーメッセージが返ってきているか" do
           sento.name = ''
           is_expected.to eq false
           expect(sento.errors[:name]).to include('を入力してください')
        end
        it "introductionが空白の場合にバリデーションチェックされ空白に対してエラーメッセージが返ってきているか" do
           sento.introduction = ''
           is_expected.to eq false
           expect(sento.errors[:introduction]).to include('を入力してください')
        end
        it "addressが空白の場合にバリデーションチェックされ空白に対してエラーメッセージが返ってきているか" do
           sento.address = ''
           is_expected.to eq false
           expect(sento.errors[:address]).to include('を入力してください')
        end
        it "postal_codeが空白の場合にバリデーションチェックされ空白に対してエラーメッセージが返ってきているか"do
           sento.postal_code = ''
           is_expected.to eq false
           expect(sento.errors[:postal_code]).to include('を入力してください')
        end
        it "business_hourが空白の場合にバリデーションチェックされ空白に対してエラーメッセージが返ってきているか"do
           sento.business_hour = ''
           is_expected.to eq false
           expect(sento.errors[:business_hour]).to include('を入力してください')
        end
        it "holidayが空白の場合にバリデーションチェックされ空白に対してエラーメッセージが返ってきているか"do
           sento.holiday = ''
           is_expected.to eq false
           expect(sento.errors[:holiday]).to include('を入力してください')
        end
        it "telephone_numberが空白の場合にバリデーションチェックされ空白に対してエラーメッセージが返ってきているか" do
           sento.telephone_number = ''
           is_expected.to eq false
           expect(sento.errors[:telephone_number]).to include('を入力してください')
        end
        it "priceが空白の場合にバリデーションチェックされ空白に対してエラーメッセージが返ってきているか" do
           sento.price = ''
           is_expected.to eq false
           expect(sento.errors[:price]).to include('を入力してください')
        end
        it "parkingが空白の場合にバリデーションチェックされ空白に対してエラーメッセージが返ってきているか" do
           sento.parking = ''
           is_expected.to eq false
           expect(sento.errors[:parking]).to include('を入力してください')
        end
           it "temperatureが空白の場合にバリデーションチェックされ空白に対してエラーメッセージが返ってきているか" do
           sento.temperature = nil
           is_expected.to eq false
           expect(sento.errors[:temperature]).to include('を入力してください')
        end
        it "towelが空白の場合にバリデーションチェックされ空白に対してエラーメッセージが返ってきているか" do
           sento.towel = ''
           is_expected.to eq false
           expect(sento.errors[:towel]).to include('を入力してください')
        end
        it "soapが空白の場合にバリデーションチェックされ空白に対してエラーメッセージが返ってきているか" do
           sento.soap = ''
           is_expected.to eq false
           expect(sento.errors[:soap]).to include('を入力してください')
        end
      end

  end
end