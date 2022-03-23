class Admin::OrdersController < ApplicationController

  def index

    @orders = Order.page(params[:page])

  end

  def show
    @order = Order.find(params[:id])
    # @order_ditails =
    # @total_price = @order_ditails.inject(0) { |sum, item| sum + item.subtotal }
    # @postage = @order.postage
  end


  def update
    #@order = Order.find(params[:order_detail_id])
    @order = Order.find(params[:id])
    @order_details = @order.order_details
     @order.update(order_params)
      if @order.status == "confirm_payment"#入金確認
      @order_details.update_all(production_status: 1)
      end
      redirect_to admin_order_path(@order)

  end



  private

  def order_params
    params.require(:order).permit(:status)
  end
end
