class PaymentInfomation < ApplicationRecord
  belongs_to :payment

  validates :postal_code, :prefecture_id, :city, :address, :phone_number, :payment, presence: true
end
