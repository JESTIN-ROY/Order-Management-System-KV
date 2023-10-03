# frozen_string_literal: true

FactoryBot.define do
  factory :category do
    name { Faker::Name.name }
    parent_category { Faker::Number.digit }

  end
end
