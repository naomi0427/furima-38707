class OrdersController < ApplicationController

  def index
    @order = Order.new
  end

  def create
    @order = Order.new(order_params)
  end





  private

  def order_params
    params.require(:order).permit(:post_code, :from_prefecture_id, :to_city, :to_house_number, :to_building_name, :to_telephone_number).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end
end
