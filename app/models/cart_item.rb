class CartItem < ApplicationRecord
  
  belongs_to :customer
  belongs_to :item
  
  validates :quantity, presence: true, length: {maximum: 20, minimum: 0}, numericality: true #２０個制限
end
