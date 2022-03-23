class Admin::OrdersController < ApplicationController

  def index

    @orders = Order.page(params[:page])

  end

  def show
    @order = Order.find(params[:id])
    @order_ditails = @order.order_ditails.all
    @total_price = @order_ditails.inject(0) { |sum, item| sum + item.subtotal }
    @postage = @order.postage
  end

  def update
    
  end
end
