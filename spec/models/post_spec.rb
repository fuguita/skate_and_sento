require 'rails_helper'

RSpec.describe Post, "モデルに関するテスト", type: :model do
  describe 'POSTモデルのテスト' do
    it "有効な投稿内容の場合は保存されるか" do
      expect(FactoryBot.build(:post)).to be_valid
    end
  end
  context "空白のバリデーション" do
    it "parkが空白の場合にバリデーションチェックされ空白に対してエラーメッセージが返ってきているか" do
      post = (FactoryBot.build(:post, park: ""))
      # post = Post.new(park: '', sento:'hoge', park_caption:'hoge', sento_caption:'hoge')
      expect(post).to be_invalid
      expect(post.errors[:park]).to include("を入力してください")
    end
    it "sentoが空白の場合にバリデーションチェックされ空白に対してエラーメッセージが返ってきているか" do
      post = (FactoryBot.build(:post, sento: ""))
      expect(post).to be_invalid
      expect(post.errors[:sento]).to include("を入力してください")
    end
    it "park_captionが空白の場合にバリデーションチェックされ空白に対してエラーメッセージが返ってきているか" do
      post = (FactoryBot.build(:post, park_caption: ""))
      expect(post).to be_invalid
      expect(post.errors[:park_caption]).to include("を入力してください")
    end
    it "sento_captionが空白の場合にバリデーションチェックされ空白に対してエラーメッセージが返ってきているか" do
      post = (FactoryBot.build(:post, sento_caption: ""))
      expect(post).to be_invalid
      expect(post.errors[:sento_caption]).to include("を入力してください")
    end
    it "prefecture_idが空白の場合にバリデーションチェックされ空白に対してエラーメッセージが返ってきているか" do
      post = (FactoryBot.build(:post, prefecture_id: nil))
      expect(post).to be_invalid
      expect(post.errors[:prefecture_id]).to include("を選択してください")
    end
    it "post_park_imageが空白の場合にバリデーションチェックされ空白に対してエラーメッセージが返ってきているか" do
      post = FactoryBot.build(:post)
      post.post_park_image.attach(nil)
      expect(post).to be_invalid
      expect(post.errors[:post_park_image]).to include("を選択してください")
    end
     it "post_sento_imageが空白の場合にバリデーションチェックされ空白に対してエラーメッセージが返ってきているか" do
      post = FactoryBot.build(:post)
      post.post_sento_image.acctach(nil)
      expecr(post).to be_invalid
      expect(post.errors[:post_sento_image]).to include("を選択してください")
    end
  end
end