class Public::OrdersController < ApplicationController

  def new
    @order = Order.new
  end

  def create
  end

  def confirm
    @cart_items = CartItem.all
    # 新しい住所
    @order = Order.new(order_params)
    # 登録済み住所
    @address = Address.find(params[:order][:address_id])
    # 自身の住所
    @order.post_code = @address.post_code
    @order.address = @address.address
    @order.name = @address.name
  end

  def thanks
  end

  def index
    @orders = current_customer.orders.all
    
  end

  def show
    @order = Order.find(params[:id])
    @order_details = @order.order_details
  end

  private

  def order_params
    params.require(:order).permit(:payment_method, :total_price, :postage, :name, :address, :post_code, :status)
  end
end
