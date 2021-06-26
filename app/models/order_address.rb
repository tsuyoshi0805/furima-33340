class OrderAddress
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :post_code, :shipping_area_id, :city, :address, :building_name, :phone_number, :order_id
  
  with_options presence: true do
  validates :shipping_area_id, :city, :address, :user_id, :item_id
  validates :post_code, format: /\A\d{3}[-]\d{4}\z/
  validates :phone_number, format: /\A\d{10,11}\z/

  with_options numericality: { other_than: 1 } do
    validates :shipping_area_id
  end
  end

  def save
    Order.create(user_id: user_id, item_id: item_id)
  Address.create(post_code: post_code, shipping_area_id: shipping_area_id, city:city, address:address, building_name:building_name, phone_number:phone_number, order_id:order.id)
   
end
end