class OrdersController < ApplicationController
  before_action :authenticate_user!, only: [:create, :index]
  before_action :set_item, only:[:index, :create]
  before_action :set_item_2, only:[:index]
  
  def index
    @order_buy = OrderBuy.new
  end

  def create    #購入のアクション
    @order_buy = OrderBuy.new(orderbuy_params)
    if @order_buy.valid?
      Payjp.api_key = ENV["PAYJP_SECRET_KEY"]  # 自身のPAY.JPテスト秘密鍵を記述しましょう
      Payjp::Charge.create(
        amount: @item.price,  # 商品の値段
        card: orderbuy_params[:token],    # カードトークン
        currency: 'jpy'                 # 通貨の種類（日本円）
      )
      @order_buy.save
      return redirect_to root_path
    else
      render action: :index
    end
  end
  
  private

  def orderbuy_params
    params.require(:order_buy).permit(:postal_code, :prefecture_id, :city, :address_number, :name_of_building, :tell).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end

  def set_item
    @item = Item.find(params[:item_id])
  end

  def set_item_2
    if current_user.id == @item.user_id || @item.buy.present?
      redirect_to root_path
    end
  end
  
end