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
        expect(@item.errors.full_messages).to include "画像を入力してください"
      end

      it "nameが空だと登録できない" do
        @item.name = ' '
        @item.valid?
        expect(@item.errors.full_messages).to include "商品名を入力してください"
      end
      
      it "introductionが空だと登録できない" do
        @item.introduction = ' '
        @item.valid?
        expect(@item.errors.full_messages).to include "商品説明を入力してください"
      end
      
      it "category_idが空だと登録できない" do
        @item.category_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include "カテゴリーを入力してください"
      end
      
      it "category_idが空だと登録できない" do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include "カテゴリーは1以外の値にしてください"
      end
      
      it "status_idが空だと登録できない" do
        @item.status_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include "商品の状態を入力してください"
      end
      
      it "status_idが--だと登録できない" do
        @item.status_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include "商品の状態は1以外の値にしてください"
      end
      
      it "shipping_idが--だと登録できない" do
        @item.shipping_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include "配送料の負担を入力してください"
      end
      
      it "shipping_idが--だと登録できない" do
        @item.shipping_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include "配送料の負担は1以外の値にしてください"
      end

      it "prefecture_idが--だと登録できない" do
        @item.prefecture_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include "発送元の地域は数値で入力してください"
      end
      
      it "prefecture_idが--だと登録できない" do
        @item.prefecture_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include "発送元の地域は1以外の値にしてください"
      end

      it "date_of_shipment_idが--だと登録できない" do
        @item.date_of_shipment_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include "発送までの日数を入力してください"
      end
      
      it "date_of_shipment_idが--だと登録できない" do
        @item.date_of_shipment_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include "発送までの日数は1以外の値にしてください"
      end

      it "priceが空だと登録できない" do
        @item.price = nil
        @item.valid?
        expect(@item.errors.full_messages).to include "販売価格を入力してください"
      end

      it "priceが半角英数字混合では出品できない" do
        @item.price = 'A9'
        @item.valid?
        expect(@item.errors.full_messages).to include  "販売価格は一覧にありません"
      end

      it "priceが半角英字のみでは出品できない" do
        @item.price = 'aaaa'
        @item.valid?
        expect(@item.errors.full_messages).to include "販売価格は一覧にありません"
      end

      it "priceが全角文字では出品できない" do
        @item.price = 'あああ'
        @item.valid?
        expect(@item.errors.full_messages).to include "販売価格は一覧にありません"
      end

      it "priceが299円以下では出品できない" do
        @item.price = 299
        @item.valid?
        expect(@item.errors.full_messages).to include "販売価格は一覧にありません"
      end

      it "priceが10_000_000円以上では出品できない" do
        @item.price = '11111111'
        @item.valid?
        expect(@item.errors.full_messages).to include "販売価格は一覧にありません"
      end
    end
  end
end