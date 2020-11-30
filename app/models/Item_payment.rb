class ItemPayment
  include ActiveModel::Model
  attr_accessor :postal_code, :prefecture_id, :city, :address, :building, :phone_number, :item_id, :user_id, :token

  validates :postal_code, :prefecture_id, :city, :address, :phone_number, presence: true
  validates :token, presence: true

  def save
    payment = Payment.create(user_id: user_id, item_id: item_id)
    PaymentInfomation.create(postal_code: postal_code, prefecture_id: prefecture_id, city: city, address: address, building: building, phone_number: phone_number, payment_id: payment.id)
  end

end