class ItemPayment
  include ActiveModel::Model
  attr_accessor :postal_code, :prefecture_id, :city, :address, :building, :phone_number, :item_id, :user_id, :token

  validates :prefecture_id, :city, :address, presence: true
  validates :token, presence: true

  with_options presence: true do
    validates :postal_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: 'is invalid. Include hyphen(-)' }
    validates :phone_number, format: { with: /\A\d{10,11}\z/, message: 'is invalid. Input 10 or 11 number' }
  end

  def save
    payment = Payment.create(user_id: user_id, item_id: item_id)
    PaymentInfomation.create(postal_code: postal_code, prefecture_id: prefecture_id, city: city, address: address, building: building, phone_number: phone_number, payment_id: payment.id)
  end
end
