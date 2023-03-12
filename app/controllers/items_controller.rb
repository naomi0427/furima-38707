class ItemsController < ApplicationController
  def index
  end

  def new
    before_action :authenticate_user!
    @items = Item.new
  end

end