FactoryBot.define do
  factory :order_address do
    post_code        {"123-4567"}
    shipping_area_id {2}
    city             {"鬼北町"}
    address          {"1-1"}
    phone_number     {"09012345678"}
    token {"tok_abcdefghijk00000000000000000"}
    end
  end
