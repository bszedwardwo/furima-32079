require 'rails_helper'

RSpec.describe ItemPayment, type: :model do
  before do
    @itempayment = FactoryBot.build(:item_payment)
  end
  context '正常にデータベースに購入データが保存できる時' do
    it '全ての値があれば保存できる' do
      expect(@itempayment).to be_valid
    end
    it 'buildingが空でも保存できる' do
      @itempayment.building = ''
      expect(@itempayment).to be_valid
    end
  end
end