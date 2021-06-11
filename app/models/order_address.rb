class OrderAddress
  include ActiveModel::Model
  attr_accessor :integer, :text
  
  validates :integer, presence: true
  validates :text, presence: true

  def save
    Order.create(integer: integer)
  Address.create(text: text)
  end
end