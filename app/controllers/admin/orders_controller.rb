class Admin::OrdersController < ApplicationController

  def index

    @orders = Order.all

  end

  def show
    @order = Order.find(params[:id])
    @order_ditails = @order.order_ditails
  end

  def update
  end
end
