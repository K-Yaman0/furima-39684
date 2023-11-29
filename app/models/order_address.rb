class OrderAddress
  include ActiveModel::Model
  attr_accessor :postal_code, :prefecture_id, :city, :block, :building,
                :phone_number, :item_id, :user_id, :order_id, :token

  with_options presence: true do
    validates :token , presence: { message: 'を正しく入力してください' }
    validates :postal_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: 'は次のように入力してください(例 123-4567)' }
    validates :prefecture_id, numericality: { other_than: 0, message: "を入力してください" }
    validates :city
    validates :block
    validates :phone_number, length: { minimum: 10, message: 'は10桁または11桁で入力してください' },
                             format: { with: /\A\d{10,11}\z/, message: 'は半角数字で入力してください' }
    validates :user_id, presence: { message: 'が見つかりません' }
    validates :item_id, presence: { message: 'が見つかりません' }
  end

  def save
    order = Order.create(user_id:, item_id:)
    Address.create(postal_code:, prefecture_id:, city:, block:, building:,
                   phone_number:, order_id: order.id)
  end
end
