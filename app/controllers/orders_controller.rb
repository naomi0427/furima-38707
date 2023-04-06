class OrdersController < ApplicationController
  before_action :authenticate_user!, only: :index
  before_action :set_item, only: [:index, :create]

  def index
    @order = Order.new
  end

  def new
    @order = Order.new
  end

  def create
    @order = Order.new(after_sale_params)
    if @order.valid?
      pay_item
      @order.save
      redirect_to root_path
    else
     render 'index'
    end
  end

  private

  def after_sale_params
    params.require(:order).permit(:post_code, :from_prefecture_id, :to_city, :to_house_number, :to_building_name, :to_telephone_number).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end

  def set_item
    @item = Item.find(params[:item_id])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.price,
      card: after_sale_params[:token],
      currency: 'jpy'
    )
  end
  #if current_user.id == @item.user_id or @item.after_sale.present?
end
