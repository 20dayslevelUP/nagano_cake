class Address < ApplicationRecord
  belongs_to :customers

  validates :post_code, presence: true, length: { maximum: 7, minimun: 7 },numericality: true
  validates :address, presence: true
  validates :name, presence: true
end