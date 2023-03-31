class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit,:destroy]
  before_action :set_item, only: [:show, :edit, :update,:destroy]
  before_action :soldout_edit, only: [:edit]
  def index
    @item = Item.all
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
      redirect_to @item
    else
      render :edit
    end
  end

  def destroy
    if @item.user == current_user
    @item.destroy
    redirect_to root_path
    else
  redirect_to root_path
end
end


  private

  def item_params
    params.require(:item).permit(:name,:price,:description, :category_id,:condition_id, :shipping_id,:region_id,:day_to_ship_id,:image).merge(user_id: current_user.id)
  end
  
  def set_item
    @item = Item.find(params[:id])
  end
  def soldout_edit
       @item = Item.find(params[:id])
    if @item.order.blank? && @item.user_id == current_user.id
      render :edit
    else
      redirect_to root_path
  end
end
end
