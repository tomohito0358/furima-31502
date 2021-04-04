require 'rails_helper'


RSpec.describe Order,type: :model do
  before do
    @item = FactoryBot.build(:item)
    @item.image = fixture_file_upload('app/assets/images/item-sample.png')
    @item.save
    @user = FactoryBot.create(:user)
    @order_buy = FactoryBot.build(:order_buy, user_id: @user.id, item_id: @item.id)
    sleep 0.5
  end
  
  describe "アイテム購入" do
    context  'アイテム購入がうまくいくとき' do
      it "token,postal_code,prefecture_id,city,address_number,tellが存在すれば登録できる" do
        expect(@order_buy).to be_valid
      end
      
      it "name_of_buildingが空でも登録できる" do
        @order_buy.name_of_building = ' '
        @order_buy.valid?
      end
    end

    context ' アイテム購入がうまくいかないとき' do

      it "tokenが空だと登録できない" do
        @order_buy.token = ' '
        @order_buy.valid?
        expect(@order_buy.errors.full_messages).to include "クレジットカード情報を入力してください"
      end

      it "postal-codeが空だと登録できない" do
        @order_buy.postal_code = ' '
        @order_buy.valid?
        expect(@order_buy.errors.full_messages).to include "郵便番号を入力してください"
      end

      it "postal-codeにに-が無いと登録できない" do
        @order_buy.postal_code = '1231234'
        @order_buy.valid?
        expect(@order_buy.errors.full_messages).to include "郵便番号は不正な値です"
      end

      it "address_numberが空だと登録できない" do
        @order_buy.address_number = ' '
        @order_buy.valid?
        expect(@order_buy.errors.full_messages).to include "番地を入力してください"
      end
      
      it "prefecture_idが[ 1 ]だと登録できない" do
        @order_buy.prefecture_id = 1
        @order_buy.valid?
        expect(@order_buy.errors.full_messages).to include "都道府県は1以外の値にしてください"
      end
      
      it "cityが空だと登録できない" do
        @order_buy.city = ' '
        @order_buy.valid?
        expect(@order_buy.errors.full_messages).to include "市町村を入力してください"
      end

      
      it "tellが空だと登録できない" do
        @order_buy.tell = ' '
        @order_buy.valid?
        expect(@order_buy.errors.full_messages).to include "電話番号を入力してください"
      end

      it "tellは英数混合だと登録できない" do
        @order_buy.tell ='090aaaa2222'
        @order_buy.valid?
        expect(@order_buy.errors.full_messages).to include "電話番号は不正な値です"
      end

      it "tellに数字以外が入力されていると登録できない" do
        @order_buy.tell = '090-1111-2222'
        @order_buy.valid?
        expect(@order_buy.errors.full_messages).to include "電話番号は不正な値です"
      end

      it "tellが12桁以上だと登録できない" do
        @order_buy.tell = '0901111122222'
        @order_buy.valid?
        expect(@order_buy.errors.full_messages).to include "電話番号は不正な値です"
      end

      it "user_idが空だと登録できない" do
        @order_buy.tell = ' '
        @order_buy.valid?
        expect(@order_buy.errors.full_messages).to include "電話番号を入力してください"
      end

      it "item_idが空だと登録できない" do
        @order_buy.tell = ' '
        @order_buy.valid?
        expect(@order_buy.errors.full_messages).to include "電話番号を入力してください"
      end
    end
  end
end
