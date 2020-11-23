require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end
  context '新規商品出品ができる時' do
    it '必要な項目が全て埋まっていれば登録できる' do

    end
    it '商品名が40文字いないなら登録できる' do
      
    end
    it '商品説明が1000文字いないなら登録できる' do
      
    end
    it '値段が300~9999999の間なら登録できる' do
      
    end
  end
end
