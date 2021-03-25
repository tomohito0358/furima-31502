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
      it "token,postal_code,prefecture_id,city,address_number,name_of_building,tellが存在すれば登録できる" do
        expect(@order_buy).to be_valid
      end
    end

    context ' アイテム購入がうまくいかないとき' do

      it "tokenが空だと登録できない" do
        @order_buy.token = ' '
        @order_buy.valid?
        expect(@order_buy.errors.full_messages).to include "Token can't be blank"
      end

      it "postal-codeが空だと登録できない" do
        @order_buy.postal_code = ' '
        @order_buy.valid?
        expect(@order_buy.errors.full_messages).to include "Postal code can't be blank"
      end

      it "address_numberが空だと登録できない" do
        @order_buy.address_number = ' '
        @order_buy.valid?
        expect(@order_buy.errors.full_messages).to include "Address number can't be blank"
      end
      
      it "prefecture_idが空だと登録できない" do
        @order_buy.prefecture_id = ' '
        @order_buy.valid?
        expect(@order_buy.errors.full_messages).to include "Prefecture can't be blank"
      end
      
      it "cityが空だと登録できない" do
        @order_buy.city = ' '
        @order_buy.valid?
        expect(@order_buy.errors.full_messages).to include "City can't be blank"
      end
      
      it "name_of_buildingが空だと登録できない" do
        @order_buy.name_of_building = ' '
        @order_buy.valid?
        expect(@order_buy.errors.full_messages).to include "Name of building can't be blank"
      end
      
      it "tellが空だと登録できない" do
        @order_buy.tell = ' '
        @order_buy.valid?
        expect(@order_buy.errors.full_messages).to include "Tell can't be blank"
      end
    end
  end
end
