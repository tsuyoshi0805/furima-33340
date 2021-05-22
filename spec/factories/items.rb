FactoryBot.define do
  factory :item do
    
    name              {"tomato"}
    price             {300}
    description       {1}
    status_id         {1}
    shipping_day_id   {1}
    shipping_cost_id  {1}
    shipping_area_id  {1}
    category_id       {1}
    
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    
  end
end
end