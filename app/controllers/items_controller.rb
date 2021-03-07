class ItemsController < ApplicationController

  def index
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def item_params
    params.require(:item).permit(:image, :name, :introduction, :category_id, :status_id, :shipping_id, :prefecture_id, :date_of_shipment_id, :price, :user_id).merge(user_id: current_user.id)
  end

end
