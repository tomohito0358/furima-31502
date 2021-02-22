require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end
  describe "ユーザー新規登録" do

    it "nicknameが空だと登録できない" do
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