require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
    @item.image = fixture_file_upload('app/assets/images/item-sample.png')
  end

  describe "アイテム新規投稿" do
    context  'アイテム新規投稿がうまくいくとき' do
      it "name,introduction,category_id,status_id,shipping_id,prefecture_id,date_of_shipment_id,priceが存在すれば登録できる" do
        expect(@item).to be_valid
      end
    end

    context ' アイテム新規投稿がうまくいかないとき' do

      it "imageが空だと登録できない" do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include "Image can't be blank"
      end

      it "nameが空だと登録できない" do
        @item.name = ' '
        @item.valid?
        expect(@item.errors.full_messages).to include "Name can't be blank"
      end

      it "introductionが空だと登録できない" do
        @item.introduction = ' '
        @item.valid?
        expect(@item.errors.full_messages).to include "Introduction can't be blank"
      end

      it "category_idが--だと登録できない" do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include "Category must be other than 1"
      end
 
      it "status_idが--だと登録できない" do
        @item.status_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include "Status must be other than 1"
      end

      it "shipping_idが--だと登録できない" do
        @item.shipping_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include "Shipping must be other than 1"
      end

      it "prefecture_idが--だと登録できない" do
        @item.prefecture_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include "Prefecture must be other than 1"
      end

      it "date_of_shipment_idが--だと登録できない" do
        @item.date_of_shipment_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include "Date of shipment must be other than 1"
      end

      it "priceが空だと登録できない" do
        @item.price = ' '
        @item.valid?
        expect(@item.errors.full_messages).to include "Price can't be blank"
      end

      it "priceが半角英数字混合では出品できない" do
        @item.price = 'A9'
        @item.valid?
        expect(@item.errors.full_messages).to include "Price is not included in the list"
      end

      it "priceが半角英字のみでは出品できない" do
        @item.price = 'aaaa'
        @item.valid?
        expect(@item.errors.full_messages).to include "Price is not included in the list"
      end

      it "priceが全角文字では出品できない" do
        @item.price = 'あああ'
        @item.valid?
        expect(@item.errors.full_messages).to include "Price is not included in the list"
      end

      it "priceが299円以下では出品できない" do
        @item.price = '299'
        @item.valid?
        expect(@item.errors.full_messages).to include "Price is not included in the list"
      end

      it "priceが10_000_000円以上では出品できない" do
        @item.price = '11111111'
        @item.valid?
        expect(@item.errors.full_messages).to include "Price is not included in the list"
      end
    end
  end
end