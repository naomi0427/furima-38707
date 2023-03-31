class OrdersController < ApplicationController

  def index
    @order = Order.new
  end

  def create
    @order = Order.new()
  end
end
