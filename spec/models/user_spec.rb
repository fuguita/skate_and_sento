require 'rails_helper'

RSpec.describe User, "Userモデルに関するテスト", type: :model do
  describe 'USERモデルのテスト' do
    subject { user.valid? }

      let(:user) { build (:user)}

      context 'nameカラム' do
        it '空欄でないこと' do
          user.name = ''
          is_expected.to eq false
          expect(user.errors[:name]).to include("は2文字以上で入力してください")
        end
        it '2文字以上であること: 1文字は×、エラーメッセージが返ってくるか' do
          user.name = Faker::Lorem.characters(number: 1)
          is_expected.to eq false
          expect(user.errors[:name]).to include("は2文字以上で入力してください")
        end
        it '2文字以上であること: 2文字は〇' do
          user.name = Faker::Lorem.characters(number: 2)
          is_expected.to eq true
        end
        it '20文字以下であること: 20文字は〇' do
          user.name = Faker::Lorem.characters(number: 20)
          is_expected.to eq true
        end
        it '20文字以下であること: 21文字は×' do
          user.name = Faker::Lorem.characters(number: 21)
          is_expected.to eq false
          expect(user.errors[:name]).to include("は20文字以内で入力してください")
        end
      end
      context "ユニークのテスト" do
        let!(:other_user) { create(:user) }

        it 'nameの一意性がある' do
          user.name = other_user.name
          is_expected.to eq false
        end
        it 'emailの一意性がある' do
          user.email = other_user.email
          is_expected.to eq false
        end
      end
      context "emailのカラム" do
        it '空欄でないこと、エラーメッセージが返される' do
          user.email = ''
          is_expected.to eq false
          expect(user.errors[:email]).to include ('を入力してください')
        end
      end
  end
end
  #   it "バリデーションのテスト" do
  #     expect(FactoryBot.build(:user)).to be_valid
  #   end
  # end
  # context "空白のバリデーション" do

