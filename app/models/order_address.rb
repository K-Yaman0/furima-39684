class OrderAddress

  include ActiveModel::Model
  attr_accessor :postal_code, :prefecture_id, :city ,:block,
                :building, :phone_number, :item_id, :user_id, :order_id

  [:postal_code, :prefecture_id, :city ,:block, :building, :phone_number].each do |v|
    validates v, presence: true
  end

  belongs_to :order

  def save
    order = Order.create(user_id: user_id, item_id: item_id)
    Address.create(postal_code: postal_code, prefecture_id: prefecture_id, city: city, block: block, building: building,phone_number: phone_number, order_id: order.id )
  end
  
end