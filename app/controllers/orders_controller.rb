class OrdersController < ApplicationController
  before_action :authenticate_user!, only: [:index,:create]
  before_action :check_item_sold_out, only: [:index, :create]
  before_action :set_order, only: [:index,:create]
  
  def index
    @order_address = OrderAddress.new
    @item = Item.find(params[:item_id])
  end


  def create
    @item = Item.find(params[:item_id])
    @order_address = OrderAddress.new(order_params)
      
    if @order_address.valid?
      pay_item
      @order_address.save
      redirect_to root_path
    else
      render :index
    end
  end



  private

  def order_params
    params.require(:order_address).permit(:postal_code, :region_id, :city, :street, :building, :phone_number)
    .merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end
  
  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.price,
      card: order_params[:token],
      currency: 'jpy'
    )
  end

  def check_item_sold_out
    item = Item.find(params[:item_id])
    redirect_to root_path if item.order.present? || item.user_id == current_user.id
  end
  def set_order
    @item = Item.find(params[:item_id])
  end
 


end