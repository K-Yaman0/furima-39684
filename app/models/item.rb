class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :item_condition
  belongs_to :freight
  belongs_to :prefecture
  belongs_to :ship_date

  [:image, :item_name, :description, :price].each do |v|
    validates v, presence: true
  end

  validates :price, numericality: { in: 300..9999999, message: "is out of setting range" }

  [:category_id, :item_condition_id, :freight_id, :prefecture_id, :ship_date_id].each do |v|
    validates v, numericality: { other_than: 1 , message: "can't be blank" }
  end

  has_one_attached :image

end
