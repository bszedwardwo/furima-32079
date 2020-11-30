require 'rails_helper'

RSpec.describe ItemPayment, type: :model do
  before do
    @item_payment = FactoryBot.build(:item_payment)
  end
  context '正常にデータベースに購入データが保存できる時' do
    it '全ての値があれば保存できる' do
      expect(@item_payment).to be_valid
    end
    it 'buildingが空でも保存できる' do
      @item_payment.building = ''
      expect(@item_payment).to be_valid
    end
  end
  context 'データベースに保存できない時' do
    it 'tokenが空だと保存できない' do
      @item_payment.token = nil
      @item_payment.valid?
      expect(@item_payment.errors.full_messages).to include("Token can't be blank")
    end
    it 'postal_codeが空だと保存できない' do
      @item_payment.postal_code = nil
      @item_payment.valid?
      expect(@item_payment.errors.full_messages).to include("Postal code can't be blank")
    end
    it 'postal_codeにハイフンがないと保存できない' do
      @item_payment.postal_code = "1234567"
      @item_payment.valid?
      expect(@item_payment.errors.full_messages).to include("Postal code is invalid. Include hyphen(-)")
    end
    it 'prefectureが空だと保存できない' do
      @item_payment.prefecture_id = nil
      @item_payment.valid?
      expect(@item_payment.errors.full_messages).to include("Prefecture can't be blank")
    end
    it 'cityが空だと保存できない' do
      @item_payment.city = nil
      @item_payment.valid?
      expect(@item_payment.errors.full_messages).to include("City can't be blank")
    end
    it 'addressが空だと保存できない' do
      @item_payment.address = nil
      @item_payment.valid?
      expect(@item_payment.errors.full_messages).to include("Address can't be blank")
    end
    it 'phone_numberが空だと保存できない' do
      @item_payment.phone_number = nil
      @item_payment.valid?
      expect(@item_payment.errors.full_messages).to include("Phone number can't be blank")
    end
    it 'phone_numberが10or11桁以外だと保存できない' do
      @item_payment.phone_number = '123456789'
      @item_payment.valid?
      expect(@item_payment.errors.full_messages).to include("Phone number is invalid. Input 10 or 11 number")
    end
  end
end