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
      @order.save
      redirect_to root_path
    else
     render 'index'
    end
  end

  private

  def after_sale_params
    params.require(:order).permit(:post_code, :from_prefecture_id, :to_city, :to_house_number, :to_building_name, :to_telephone_number).merge(user_id: current_user.id, item_id: params[:item_id])
  end

  def set_item
    @item = Item.find(params[:item_id])
  end


  #if current_user.id == @item.user_id or @item.after_sale.present?
end
