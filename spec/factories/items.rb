FactoryBot.define do
  factory :item do
    image               {Faker::Lorem.sentence}
    item_name           {Faker::Name.name(max_length: 40) }
    description         {Faker::Lorem.sentence}
    category_id         {Faker::Number.between(from: 1, to: 10)}
    item_condition_id   {Faker::Number.between(from: 1, to: 6)}
    freight_id          {Faker::Number.between(from: 1, to: 2)}
    prefecture_id       {Faker::Number.between(from: 1, to: 47)}
    ship_date_id        {Faker::Number.between(from: 1, to: 3)}
    price               {Faker::Number.between(from: 300, to: 9_999_999)}
    association :user
  end
end
