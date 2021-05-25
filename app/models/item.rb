class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  has_one :buy
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :shipping_cost

  with_options presence: true do
    validates :name, length: { maximum: 40 }
    validates :price, inclusion: { in: 300..9_999_999 }, format: { with: /\A[0-9]+\z/ }
    validates :description
    validates :image
  end

  with_options numericality: { other_than: 1 } do
    validates :category_id
    validates :status_id
    validates :shipping_cost_id
    validates :shipping_day_id
    validates :shipping_area_id
  end
end
