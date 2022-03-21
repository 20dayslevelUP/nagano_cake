class OrderDetail < ApplicationRecord
  belongs_to :item
  belongs_to :order

  validates :quantity, numericality: true #←在庫数20の制限かけたいが、不明
  validates :price, numericality: true
  validates :production_status, presence: true

  #enum status: { waiting_payment: 0, confirm_payment: 1, production: 2, send_ready: 3, send_complete: 4 }
  enum production_status: { 着手不可: 0, 製作待ち: 1, 製作中: 2, 製作完了: 3 } #←""つける？
end
