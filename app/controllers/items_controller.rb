class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update]
  before_action :set_item, only:[:show, :edit, :update, :destroy]
  before_action :set_item_2, only:[:edit, :update, :destroy]
  
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
  end

  def update
    if @item.update(item_params)
      redirect_to item_path
    else
      render :edit
    end
  end

  def destroy
    if @item.destroy
      redirect_to root_path
    else
      render :edit
    end
  end


  def item_params
    params.require(:item).permit(:image, :name, :introduction, :category_id, :status_id, :shipping_id, :prefecture_id, :date_of_shipment_id, :price).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end

  def set_item_2
    unless current_user.id == @item.user_id
      redirect_to root_path
    end
  end

end
