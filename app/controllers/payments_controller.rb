class PaymentsController < ApplicationController
  def index
    @item = Item.find(params[:item_id])
  end

  def create
    binding.pry
    payment = Payment.create(payment_params)
    PaymentInfomation.create(payment_infomation_params(payment))
  end

  private

  def payment_params
    params.require(:payment).permit(:item_id , :user_id).merge(item_id: item.id, user_id: user.id)
  end

  def payment_infomation_params
    params.require(:payment_infomation).parmit(:postal_code, :prefecture_id, :city, :address, :building, :phone_number)
  end
end