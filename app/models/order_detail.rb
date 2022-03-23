class OrderDetail < ApplicationRecord
  belongs_to :item
  belongs_to :order

  validates :quantity, numericality: true #←在庫数20の制限かけたいが、不明
  validates :price, numericality: true
  validates :production_status, presence: true

  enum production_status: { pending: 0, waiting: 1, working: 2, completed: 3 } 
  #enum production_status: { 着手不可: 0, 製作待ち: 1, 製作中: 2, 製作完了: 3 } 
end
