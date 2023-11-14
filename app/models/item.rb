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
    validates v, numericality: { other_than: 0, message: "can't be blank" }
  end

  validates :price, presence: true
  validates :price, numericality: { message: 'is invalid. Input half-width characters' }
  validates :price, numericality: { only_integer: true, in: 300..9_999_999, message: 'is out of setting range' }

  validates :item_name, length: { maximum: 40 }
  validates :description, length: { maximum: 1000 }

  has_one_attached :image
  belongs_to :user
  has_one :order
end
