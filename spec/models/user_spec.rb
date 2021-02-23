require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end
  describe "ユーザー新規登録" do
    context  '新規登録がうまくいくとき' do
      # it "nicknameとemail、password、irst_name、last_name、first_name_read、last_name_read、birth_dayが存在すれば登録できる" do
      #   expect(@user).to be_valid
      # end

      it "nicknameがあれば登録できる" do
        @user.nickname = 'pp'
        # binding.pry
        expect(@user).not_to be_valid
      end
      
      it "emailがあれば登録できる" do
        @user.email = "josef.hayes@hotmail.com"
        expect(@user).not_to be_valid
      end
      
      it "passwordがあれば登録できる" do
        @user.password = '111111'
        expect(@user).not_to be_valid
      end
      
      it "first_nameがあれあば登録できる" do
        @user.first_name = 'aa'
        expect(@user).not_to be_valid
      end
      
      it "last_nameがあれば登録できる" do
        @user.last_name = 'aa'
        expect(@user).not_to be_valid
      end
      
      it "first_name_readがあれば登録できる" do
        @user.first_name_read =  'aa'
        expect(@user).not_to be_valid
      end
      
      it "last_name_readがあれば登録できる" do
        @user.last_name_read = 'aa'
        expect(@user).not_to be_valid
      end
      
      it "birth_dayがあれば登録できる" do
        @user.birth_day = '19000101'
        expect(@user).to be_valid
      end
    end

    context ' 新規登録がうまくいかないとき' do
      it "nicknameが空だと登録できない
        " do
        @user.nickname = ' '
        @user.valid?
        expect(@user.errors.full_messages).to include "Nickname can't be blank"
      end
      
      it "emailが空だと登録できない" do
        @user.email = ' '
        @user.valid?
        expect(@user.errors.full_messages).to include "Email can't be blank"
      end
      
      it "passwordが空だと登録できない" do
        @user.password = ' '
        @user.valid?
        expect(@user.errors.full_messages).to include "Password can't be blank"
      end
      
      it "first_nameが空だと登録できない" do
        @user.first_name = ' '
        @user.valid?
        expect(@user.errors.full_messages).to include "First name can't be blank"
      end
      
      it "last_nameが空だと登録できない" do
        @user.last_name = ' '
        @user.valid?
        expect(@user.errors.full_messages).to include "Last name can't be blank"
      end
      
      it "first_name_readが空だと登録できない" do
        @user.first_name_read = ' '
        @user.valid?
        expect(@user.errors.full_messages).to include "First name read can't be blank"
      end
      
      it "last_name_readが空だと登録できない" do
        @user.last_name_read = ' '
        @user.valid?
        expect(@user.errors.full_messages).to include "Last name read can't be blank"
      end
      
      it "birth_dayが空だと登録できない" do
        @user.birth_day = ' '
        @user.valid?
        expect(@user.errors.full_messages).to include "Birth day can't be blank" 
      end
    end
  end
end