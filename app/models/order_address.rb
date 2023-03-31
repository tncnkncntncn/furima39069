class OrderAddress
  include ActiveModel::Model
  attr_accessor :postal_code, :region_id, :city, :street, :building, :phone_number, :user_id, :token, :item_id

  with_options presence: true do
    validates :postal_code, format: { with: /\A\d{3}-\d{4}\z/, message: '○:123-4567 ×:1234567' }
    validates :user_id, :item_id,:token,:city,:street,:phone_number
    validates :phone_number, format: { with: /\A\d{10,11}\z/, message: '半角数字で入れてください。○:09012345678  ×:090-1234-5678'}
  end
  validates :region_id, numericality: { other_than: 1, message: 'can not be blank' }
  
  
  def save
    order = Order.create(item_id: item_id, user_id: user_id)
    Address.create(postal_code: postal_code, region_id: region_id, city: city, street: street, building: building, phone_number: phone_number, order_id: order.id)
  end
end
