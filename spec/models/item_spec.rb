require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end
  context '新規商品出品ができる時' do
    it '必要な項目が全て埋まっていれば登録できる' do
      expect(@item).to be_valid
    end
    it '商品名が40文字いないなら登録できる' do
      @item.name = 'faohgaeofanaog'
      expect(@item).to be_valid
    end
    it '商品説明が1000文字いないなら登録できる' do
      @item.info = 'gajoigahgaofianheilfnglieugbnalinuhwfba'
      expect(@item).to be_valid
    end
    it '値段が300~9999999の間なら登録できる' do
      @item.price = '999999'
      expect(@item).to be_valid
    end
  end
  context '新規商品出品ができない時' do
    it '商品画像がない時' do

    end
    it '商品名が空の時' do
      
    end
    it '商品名が41文字以上の時' do
      
    end
    it '商品の説明が空の時' do
      
    end
    it '商品の説明が1001文字以上の時' do
      
    end
    it '商品のカテゴリーが空の時' do

    end
    it '商品の状態が空の時' do
      
    end
    it '配送料の負担について情報が空の時' do
      
    end
    it '発送元の地域についての情報が空の時' do
      
    end
    it '発送までの日数についての情報が空の時' do
      
    end
    it '価格が空の時' do
      
    end
    it '価格が300より少ない時' do
      
    end
    it '価格が9999999より多い時' do
      
    end
    it '価格が半角数字じゃない時' do
      
    end
  end
end
