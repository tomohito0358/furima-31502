require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end
  describe "ユーザー新規登録" do
    context  '新規登録がうまくいくとき' do
      it "nicknameとemail、password、irst_name、last_name、first_name_read、last_name_read、birth_dayが存在すれば登録できる" do
        expect(@user).to be_valid
      end
    end

    context ' 新規登録がうまくいかないとき' do
      it "nicknameが空だと登録できない" do
        @user.nickname = ' '
        @user.valid?
        expect(@user.errors.full_messages).to include "ニックネームを入力してください"
      end

      
      it "emailが空だと登録できない" do
        @user.email = ' '
        @user.valid?
        expect(@user.errors.full_messages).to include "Eメールを入力してください"
      end

      it "emailに@がない場合登録できない" do
        @user.email = 'aaa.com'
        @user.valid?
        expect(@user.errors.full_messages).to include "Eメールは不正な値です"
      end

      it "重複したemailが存在する場合登録できないこと" do
        @user.save
        another_user = FactoryBot.build(:user, email: @user.email)
        another_user.valid?
        expect(another_user.errors.full_messages).to include "Eメールはすでに存在します"
      end
      
      it "passwordが空だと登録できない" do
        @user.password = ' '
        @user.valid?
        expect(@user.errors.full_messages).to include "パスワードを入力してください"
      end
      
      it "passwordが半角英語のみは登録できない" do
        @user.password = 'aaaaaaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include "パスワードは不正な値です"
      end

      it "passwordが数字のみは登録できない" do
        @user.password = '1234567'
        @user.valid?
        expect(@user.errors.full_messages).to include "パスワードは不正な値です"
      end
      
      it "passwordが6文字以下では登録できない" do
        @user.password = '111aa'
        @user.valid?
        expect(@user.errors.full_messages).to include "パスワードは6文字以上で入力してください"
      end
      
      it "first_nameが空だと登録できない" do
        @user.first_name = ' '
        @user.valid?
        expect(@user.errors.full_messages).to include "苗字を入力してください"
      end
      
      it "first_nameは全角（漢字・ひらがな・カタカナ）以外は登録できない" do
        @user.first_name = ' あああ'
        @user.valid?
        expect(@user.errors.full_messages).to include "苗字は不正な値です"
      end
      
      it "last_nameが空だと登録できない" do
        @user.last_name = ' '
        @user.valid?
        expect(@user.errors.full_messages).to include "名前を入力してください"
      end

      it "last_nameは全角（漢字・ひらがな・カタカナ）以外は登録できない" do
        @user.last_name = ' '
        @user.valid?
        expect(@user.errors.full_messages).to include "名前は不正な値です"
      end
      
      it "first_name_readが空だと登録できない" do
        @user.first_name_read = ' '
        @user.valid?
        expect(@user.errors.full_messages).to include "読み仮名(苗字)を入力してください"
      end
      
      it "first_name_readはカタカナ意外登録できない" do
        @user.first_name_read = 'あいうえお'
        @user.valid?
        expect(@user.errors.full_messages).to include "読み仮名(苗字)は不正な値です"
      end
      
      it "last_name_readが空だと登録できない" do
        @user.last_name_read = ' '
        @user.valid?
        expect(@user.errors.full_messages).to include "読み仮名（名前）を入力してください"
      end

      it "last_name_readはカタカナ意外登録できない" do
        @user.last_name_read = 'あいうえお'
        @user.valid?
        expect(@user.errors.full_messages).to include "読み仮名（名前）は不正な値です"
      end
      
      it "birth_dayが空だと登録できない" do
        @user.birth_day = ' '
        @user.valid?
        expect(@user.errors.full_messages).to include "誕生日を入力してください"
      end
    end
  end
end