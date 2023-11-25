FactoryBot.define do
  factory :order_address do
    token               { Faker::Alphanumeric.alphanumeric(number: 30) }
    postal_code         { "#{Faker::Number.number(digits: 3)}-#{Faker::Number.number(digits: 4)}" }
    prefecture_id       { Faker::Number.between(from: 1, to: 47) }
    city                { Faker::Address.city }
    block               { Faker::Address.street_address }
    building            { Faker::Company.name }
    phone_number        { Faker::Number.number(digits: rand(10..11)) }
    association :user
    association :item
  end
end
