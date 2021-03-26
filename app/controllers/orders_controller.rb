class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_item
  before_action :set_item_2
  before_action :pay_jp, only:[:create]
  
  def index
    @order_buy = OrderBuy.new
  end

  def create    #購入のアクション
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

  def pay_jp
    @order_buy = OrderBuy.new(orderbuy_params)
    if @order_buy.valid?
      Payjp.api_key = ENV["PAYJP_SECRET_KEY"]  # 自身のPAY.JPテスト秘密鍵を記述
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
end