FactoryBot.define do
  factory :user do
    nick_name              {'test'}
    email                 {'test@example'}
    password              {'w000000'}
    password_confirmation {password}
    first_name             {'大谷'}
    name                   {'翔平'}
    first_name_kana       {'オオタニ'}
    name_kana             {'ショウヘイ'}
    birth_date             { Faker::Date.birthday(min_age: 18, max_age: 65) }
  end
end