class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category, :sales_status, :shipping_fee_status, :prefecture, :scheduled_delivery
  belongs_to :user
  has_one_attached :image

  validates :name, :info, :price, :image, :category_id, :sales_status_id, :shipping_fee_status_id, :prefecture_id, :scheduled_delivery_id, presence: true
  validates :price, numericality: { only_integer: true , greater_than: 300, less_than: 9999999 }
  validates :name, length: { maximum: 40 }
  validates :info, length: { maximum: 1000 }
end