require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品出品機能' do
    context '商品出品できるとき' do
      it 'image、item_name、description,:category_id、item_condition_id、freight_id、prefecture_id、ship_date_id、priceが存在すれば出品できる' do
        expect(@item).to be_valid
      end
    end
  end
end