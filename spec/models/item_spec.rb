require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品出品機能' do
    context '商品出品できるとき' do
      it 'image、item_name、description、category_id、item_condition_id、freight_id、prefecture_id、ship_date_id、priceが存在すれば出品できる' do
        expect(@item).to be_valid
      end
    end
    context '商品出品できないとき' do
      it 'imageが空では出品できない' do
      end
      it 'item_nameが空では出品できない' do
      end
      it 'descriptionが空では出品できない' do
      end
      it 'last_nameが空では出品できない' do
      end
      it 'category_idが空では出品できない' do
      end
      it 'item_condition_idが空では出品できない' do
      end
      it 'freight_idが空では出品できない' do
      end
      it 'prefecture_idが空では出品できない' do
      end
      it 'ship_date_idが空では出品できない' do
      end
      it 'priceが空では出品できない' do
      end
      it 'item_nameが41文字以上では出品できない' do
      end
      it 'descriptionが1001文字以上では出品できない' do
      end
      it 'priceが299以下では出品できない' do
      end
      it 'priceが10,000,000以上では出品できない' do
      end
    end
  end
end