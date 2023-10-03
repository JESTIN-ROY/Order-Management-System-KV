# frozen_string_literal: true

FactoryBot.define do
  factory :order_item do
    order
    product

    quantity { Faker::Number.digit }

  end
end
