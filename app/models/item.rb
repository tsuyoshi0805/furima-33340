class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  has_one :buy

  with_options presence: true do

    validates :name 
    validates :price 
    validates :description
    validates :category_id
    validates :status_id
    validates :shipping_cost_id
    validates :shipping_day_id
    validates :shipping_area_id
    validates :image
    end
  end
