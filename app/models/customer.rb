class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :address, dependent: :destroy
  has_many :ordeers, dependent: :destroy
  has_many :crat_items, dependent: :destroy

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :first_name_kana, presence: true
  validates :last_name_kana, presence: true
  validates :post_code, presence: true, length: {maximum: 7, minimum: 7}, numericality: true #numericality:属性に数値のみが使えるバリデーション
  validates :address, presence: true
  validates :phone_number, presence: true, length: {maximum: 11, minimum: 10}, numericality: true
end
