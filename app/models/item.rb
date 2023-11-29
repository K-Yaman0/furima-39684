class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :item_condition
  belongs_to :freight
  belongs_to :prefecture
  belongs_to :ship_date

  [:image, :item_name, :description].each do |v|
    validates v, presence: true
  end

  [:category_id, :item_condition_id, :freight_id, :prefecture_id, :ship_date_id].each do |v|
    validates v, numericality: { other_than: 0, message: 'を入力してください' }
  end

  validates :price, presence: true
  validates :price, numericality: { message: 'は半角数字で入力してください' }
  validates :price, numericality: { only_integer: true, in: 300..9_999_999, message: 'は¥300〜¥9,999,999で入力してください' }

  validates :item_name, length: { maximum: 40 }
  validates :description, length: { maximum: 1000 }

  has_one_attached :image
  belongs_to :user
  has_one :order
end
