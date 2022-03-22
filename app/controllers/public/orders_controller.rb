class Public::OrdersController < ApplicationController

  def new
    @order = Order.new
  end

  def create
  end

  def confirm
    @order = Order.new(order_params)
  end

  def thanks
  end

  def index
    @orders = Order.all
  end

  def show
    @order = Order.find(params[:id])
  end

  private

  def order_params
    params.require(:order).permit(:payment_method, :total_price, :postage, :name, :address, :post_code, :status)
  end
end
