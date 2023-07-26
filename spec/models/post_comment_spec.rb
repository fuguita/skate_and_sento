require "rails_helper"

RSpec.describe PostComment, "Userモデルに関するテスト", type: :model do
    describe "USERモデルのテスト" do
        subject { post_comment.valid? }

        let(:post_comment) { build (:post_comment) }

        context "commentカラム" do
          it "空欄でないこと、エラーメッセージが返される" do
            post_comment.comment = ""
            is_expected.to eq false
            expect(post_comment.errors[:comment]).to include("を入力してください")
          end
        end
      end
  end
