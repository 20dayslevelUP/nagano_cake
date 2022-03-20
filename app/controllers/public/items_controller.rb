class Public::ItemsController < ApplicationController

  def index
    @items = Item.page(params[:page])
  end

  def show
    @item = Item.find[params:id]
    @item_quanity = Item.new
  end
end
