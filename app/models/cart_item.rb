class CartItem < ApplicationRecord

  belongs_to :customer
  belongs_to :item

  validates :quantity, presence: true


  # 消費税を求めるメソッド
  def subtotal
    item.with_tax_price * quantity
  end
end
