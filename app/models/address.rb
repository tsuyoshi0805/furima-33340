class Address < ApplicationRecord
  belongs_to :Purchase_management
  has_many :items
end
