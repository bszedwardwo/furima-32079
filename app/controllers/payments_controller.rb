class PaymentsController < ApplicationController
  def index
    @item = Item.find(params[:item_id])
    @item_payment = ItemPayment.new()
  end

  def create
    @item_payment = ItemPayment.new(item_payment_params)
    if @item_payment.valid?
      @item_payment.save
      redirect_to root_path
    else
      @item = Item.find(params[:item_id])
      @item_payment = ItemPayment.new()
      render :index
    end
  end

  private

  def item_payment_params
    params.require(:item_payment).permit(:postal_code, :prefecture_id, :city, :address, :building, :phone_number).merge(user_id: current_user.id, item_id: params[:item_id])
  end

end