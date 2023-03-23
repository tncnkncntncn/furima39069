FactoryBot.define do
  factory :item do
    name { "商品名" }
    description { "テスト商品の説明文。" }
    category_id { 2 } 
    condition_id { 2 } 
    shipping_id { 2 } 
    region_id { 2 } 
    day_to_ship_id { 2 }
    price { 1000 }
    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test-image.jpg'), filename: 'test-image.jpg', content_type: 'test-image.jpg')
    end
  end
end