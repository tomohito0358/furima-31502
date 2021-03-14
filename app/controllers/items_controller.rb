class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]
  before_action :set_item, only:[:show, :edit,:update]
  
  def index
    @items = Item.all.order("created_at DESC")
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

  def show
  end

  def edit
    if user_signed_in?
      redirect_to edit_item_path
    else
        redirect_to root_path
    end
  end

  def update
    if user_signed_in?
      if @item.update(item_params)
        redirect_to item_path
      else
        render :edit
      end
    else
        render root_path
    end
  end

  def item_params
    params.require(:item).permit(:image, :name, :introduction, :category_id, :status_id, :shipping_id, :prefecture_id, :date_of_shipment_id, :price, :user_id).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end

end
