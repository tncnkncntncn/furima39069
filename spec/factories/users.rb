FactoryBot.define do
  factory :user do
    nick_name              {Faker::Name.initials(number: 6)}
    email                 {Faker::Internet.free_email}
    password               {'1a'+ Faker::Internet.password(min_length: 6,) }
    password_confirmation {password}
    
    first_name { '大谷' }
    name { '翔平' }
    first_name_kana { 'オオタニ' }
    name_kana { 'ショウヘイ' }
    birth_date             { Faker::Date.birthday(min_age: 18, max_age: 65) }
  end
end
