class Admin::OrdersController < ApplicationController

  def index
    @orders = Order.All
  end

  def show
  end

  def update
  end
end
