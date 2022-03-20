class Public::CustomersController < ApplicationController
  before_action :authenticate_customer!

  def show
    @customer = current_customer
  end

  def edit
    @customer = current_customer
  end

  def update
    @customer = current_customer
    @customer.update
    redirect_to customer_path(current_customer)
  end

  def unsubscribe #退会確認画面表示
  end

  def withdraw #入退会ステータス更新
  end

end
