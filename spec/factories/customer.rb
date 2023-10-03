# frozen_string_literal: true

FactoryBot.define do
  factory :customer do
    name { Faker::Name.name }
    phone { Faker::PhoneNumber.cell_phone_in_e164 }
    email { Faker::Internet.email }
    street { Faker::Address.street_name }
    city { Faker::Address.city }
    state { Faker::Address.state }
    profile_pic { Faker::Internet.url }

  end
end
