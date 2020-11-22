class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category, :sales_status, :shipping_fee_status, :prefecture, :scheduled_delivery
  belongs_to :user

  validates :title, :text, :price,:category, :sales_status, :shipping_fee_status, :prefecture, :scheduled_delivery, presence: true
end