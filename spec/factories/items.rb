FactoryBot.define do
  factory :item do
    item_name           {Faker::Name.name }
    description         {Faker::Lorem.sentence}
    category_id         {Faker::Number.between(from: 1, to: 10)}
    item_condition_id   {Faker::Number.between(from: 1, to: 6)}
    freight_id          {Faker::Number.between(from: 1, to: 2)}
    prefecture_id       {Faker::Number.between(from: 1, to: 47)}
    ship_date_id        {Faker::Number.between(from: 1, to: 3)}
    price               {Faker::Number.between(from: 300, to: 9_999_999)}
    association :user

    after(:build) do |message|
      message.image.attach(io: File.open('public/images/IMG_4251.PNG'), filename: 'IMG_4251.PNG')
    end
    
  end
end
