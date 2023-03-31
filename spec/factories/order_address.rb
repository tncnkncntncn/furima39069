FactoryBot.define do
  factory :order_address do
    postal_code {'123-4567'}
    region_id { 2 }
    city {'東京都港区'}
    street {'123-4'}
    building { '森森ビル' }
    phone_number {'09012341234'}
    token {"tok_abcdefghijk00000000000000000"}

  end
end