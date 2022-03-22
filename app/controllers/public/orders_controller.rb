class Public::OrdersController < ApplicationController

  def new
    @order = Order.new
  end

  def create
    cart_items = current_customer.cart_items.all
    @order = current_customer.orders.new(order_params)
    if @order.save
      cart_items.each do |cart_item|
        # order_detailsにも一緒にデータを保存する
        order_detail = OrderDetail.new
        order_detail.item_id = cart_item.item_id
        order_detail.order_id = @order.id
        order_detail.quantity = cart_item.quantity
        # 購入が完了したらカート情報を削除するため、ここに保存
        order_detail.price = cart_item.item.price
        # itemとの紐付けが切れる前に保存
        order_detail.save
      end
      redirect_to thanks_orders_path
      # 購入したデータをすべて削除(カートを空にする)
      cart_items.destroy_all

    else
      @order = Order.new(order_params)
      render :new
    end
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
