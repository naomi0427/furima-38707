require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe "ユーザー新規登録" do

    context "ユーザーの新規登録ができる時" do
      it "項目が全て条件をクリアした時登録ができる" do
        expect(@user).to be_valid
      end
    end

    context "ユーザーの新規登録できない時" do
      it "ニックネームが空では登録できない" do
        @user.nickname =''
        @user.valid?
        expect(@user.errors.full_messages).to include ("Nickname can't be blank")
      end

      it "メールアドレスが空では登録できない" do
        #user = FactoryBot.build(:user)
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include ("Email can't be blank")
      end
      it "重複したメールアドレスは登録できない" do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include("Email has already been taken")
      end
      it "メールアドレスに@を含まない場合は登録できない" do
        @user.email = 'sample'
        @user.valid?
        expect(@user.errors.full_messages).to include("Email is invalid")
      end

      it "パスワードが空では登録できない" do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it "パスワードが6文字未満では登録できない" do
        @user.password = 'abc'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
      end
      it "英字のみのパスワードでは登録できない" do
        @user.password = 'sample'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is invalid")
      end
      it "数字のみのパスワードでは登録できない" do
        @user.password = '012345'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is invalid")
      end
      it "全角文字を含むパスワードでは登録できない" do
        @user.password = 'サンプル'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is invalid")
      end
      it "パスワードとパスワード（確認用）が不一致だと登録できない" do
        @user.password = 'sample0123'
        @user.password_confirmation = 'sample456'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end

      it "姓（全角）が空だと登録できない" do
        @user.first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First name can't be blank")  
      end
      it "姓（全角）に半角文字が含まれていると登録できない" do
        @user.first_name = 'sample'
        @user.valid?
        expect(@user.errors.full_messages).to include("First name 全角文字を使用してください")
      end
      it "名（全角）が空だと登録できない" do
        @user.last_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name can't be blank")  
      end
      it "名（全角）に半角文字が含まれていると登録できない" do
        @user.last_name = 'sample'
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name 全角文字を使用してください")
      end

      it "姓（カナ）が空だと登録できない" do
        @user.first_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kana can't be blank")  
      end
      it "姓（カナ）にカタカナ以外の文字（平仮名・漢字・英数字・記号）が含まれていると登録できない" do
        @user.first_name_kana = 'sample'
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kana 全角文字を使用してください")
      end
      it "名（カナ）が空だと登録できない" do
        @user.last_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name kana can't be blank")
      end
      it "名（カナ）にカタカナ以外の文字（平仮名・漢字・英数字・記号）が含まれていると登録できない" do
        @user.last_name_kana = 'sample'
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name kana 全角文字を使用してください")
      end

      it "生年月日が空だと登録できない" do
        @user.birthday = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Birthday can't be blank")
      end
    end
  end
end
