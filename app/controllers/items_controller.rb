class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit, :destroy ]
  before_action :set_item, only: [:show, :edit, :update, :destroy ]

  def index
    @items = Item.order("created_at DESC")
  end

  def show
  end

  def edit
    if current_user.id != @item.user_id || @item.after_sale.present?
      redirect_to  root_path
    end
  end

  def update
    if @item.update(item_params)
    redirect_to item_path(@item.id)
    else
      render :edit
    end
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

  def destroy
    if current_user.id == @item.user_id
    @item.destroy
    end
    redirect_to root_path
  end

  private

  def item_params
    params.require(:item).permit(:image, :items_name, :explain, :category_id, :condition_id, :tax_id, :from_prefecture_id, :schedule_day_id, :price).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end
end