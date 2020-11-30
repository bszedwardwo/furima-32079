class PaymentsController < ApplicationController
  before_action :authenticate_user!, only: [:index, :create]
  before_action :find_params, only: [:index, :create]

  def index
    redirect_to root_path if current_user.id == @item.user_id || @item.payment.present?
    @item_payment = ItemPayment.new
  end

  def create
    redirect_to root_path if current_user.id == @item.user_id || @item.payment.present?
    @item_payment = ItemPayment.new(item_payment_params)
    if @item_payment.valid?
      pay_item
      @item_payment.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def item_payment_params
    params.require(:item_payment).permit(:postal_code, :prefecture_id, :city, :address, :building, :phone_number).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end

  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: @item.price,
      card: item_payment_params[:token],
      currency: 'jpy'
    )
  end

  def find_params
    @item = Item.find(params[:item_id])
  end
end
