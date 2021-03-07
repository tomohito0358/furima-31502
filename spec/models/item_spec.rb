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

      it "category_idが空だと登録できない" do
        @item.category_id = ' '
        @item.valid?
        expect(@item.errors.full_messages).to include "Category can't be blank"
      end
 
      it "status_idが空だと登録できない" do
        @item.status_id = ' '
        @item.valid?
        expect(@item.errors.full_messages).to include "Status can't be blank"
      end

      it "shipping_idが空だと登録できない" do
        @item.shipping_id = ' '
        @item.valid?
        expect(@item.errors.full_messages).to include "Shipping can't be blank"
      end

      it "prefecture_idが空だと登録できない" do
        @item.prefecture_id = ' '
        @item.valid?
        expect(@item.errors.full_messages).to include "Prefecture can't be blank"
      end

      it "date_of_shipment_idが空だと登録できない" do
        @item.date_of_shipment_id = ' '
        @item.valid?
        expect(@item.errors.full_messages).to include "Date of shipment can't be blank"
      end

      it "priceが空だと登録できない" do
        @item.price = ' '
        @item.valid?
        expect(@item.errors.full_messages).to include "Price can't be blank"
      end
    end
  end
end