class Public::OrdersController < ApplicationController

  def new
    @order = Order.new
  end

  def create
  end

  def confirm
    @order = Order.new(order_params)
    # 届け先ラジオボタンの判定条件
    # 自身の住所の場合
    if params[:order][:address_number] == "1"

      @order.name = current_customer.name
      @order.address = current_customer.address
      @order.post_code = current_customer.post_code

    #登録済みの住所の場合
    elsif params[:order][:address_number] == "2"

      @order.name = Address.find(params[:order][:address_id]).name
      @order.address = Address.find(params[:order][:address_id]).address
      @order.post_code = Address.find(params[:order][:address_id]).post_code

    # 新規登録の住所の場合
    elsif params[:order][:address_number] == "3"

      address_new = current_customer.addresses.new(address_params)
      if address_new.save
      else
        render :new
      end
    end
    @cart_items = current_customer.cart_items.all
    @total_price = @cart_items.inject(0) { |sum, item| sum + item.subtotal }
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

  def address_params
  params.require(:order).permit(:name, :address, :post_code)
  end
end
