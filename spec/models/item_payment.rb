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
  context 'データベースに保存できない時' do
    it 'tokenが空だと保存できない' do
      
    end
    it 'postal_codeが空だと保存できない' do
      
    end
    it 'postal_codeにハイフンがないと保存できない' do
      
    end
    it 'prefectureが空だと保存できない' do
      
    end
    it 'cityが空だと保存できない' do
      
    end
    it 'addressが空だと保存できない' do
      
    end
    it 'phone_numberが空だと保存できない' do
      
    end
    it 'phone_numberが10or11桁以外だと保存できない' do
      
    end
  end
end