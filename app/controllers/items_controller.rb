class ItemsController < ApplicationController
  def index
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new
    if @item.save
      redirect_to root_path
    else
      @item = @item
      render :new
    end
  end

  private
  def item_params
    params.require(:item).permit(:title, :text, :price,:category_id, :sales_status_id, :shipping_fee_status_id, :prefecture_id, :scheduled_delivery_id )
  end

end