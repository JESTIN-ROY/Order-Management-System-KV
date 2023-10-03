# frozen_string_literal: true

FactoryBot.define do
  factory :product do
    category

    name { Faker::Name.name }
    image { Faker::Internet.url }
    description { Faker::Lorem.sentence }
    unit_price { Faker::Number.decimal(l_digits: 2) }
  end
end
