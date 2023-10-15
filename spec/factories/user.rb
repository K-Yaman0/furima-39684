FactoryBot.define do
  factory :user do
    nickname              {Faker::Name.initials(number: 2)}
    email                 {Faker::Internet.email}
    password              {Faker::Internet.password(min_length: 6)}
    password_confirmation {password}
    last_name             { '田なカ' }
    first_name            { '次ろウ' }
    last_name_kana        { 'タナカ' }
    first_name_kana       { 'ジロウ' }
    birthday              { Faker::Date.between(from: '1930-01-01', to: '2018-12-31') }
  end
end