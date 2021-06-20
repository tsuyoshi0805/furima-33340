class Address < ApplicationRecord
  belongs_to :order
  has_many :items
end
