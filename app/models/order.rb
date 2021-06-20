class Order < ApplicationRecord
  belongs_to :items 
　 belongs_to :user 
　 has_one :addresses dependent :destroy
end
