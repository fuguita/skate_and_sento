require 'rails_helper'

RSpec.describe User, "モデルに関するテスト", type: :model do
  describe 'USERモデルのテスト' do
    it "有効な内容の場合は保存されるか" do
      expect(FactoryBot.build(:user)).to be_valid
    end
  end
  context "空白のバリデーション" do
    
  end
end 