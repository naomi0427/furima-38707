class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new]
  def index
  end

  def new
    @items = Item.new
  end

  def create
    Item.create(item_params)
  end

  private

  def item_params
    params.require(:item).permit(:items_name, :explain, :category_id, :condition_id, :tax_id, :from_prefecture_id, :schedule_day_id, :price, :user)
  end
end