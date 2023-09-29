# frozen_string_literal: true

require "rails_helper"

RSpec.describe Customer, type: :model do
  subject {
    Customer.new(
      name: Faker::Name.name, phone: Faker::PhoneNumber.cell_phone_in_e164, email: Faker::Internet.email,
      street: Faker::Address.street_name, city: Faker::Address.city, state: Faker::Address.state,
      country_code: 123, profile_pic: Faker::Internet.url)
  }
  it "is valid with valid attributes" do
    expect(subject).to be_valid
  end

  it "is not valid without a valid name" do
    subject.name = nil
    expect(subject).to_not be_valid
  end

  it "is not valid without a valid phone" do
    subject.phone = nil
    expect(subject).to_not be_valid
  end
  it "is not valid without a valid email" do
    subject.email = nil
    expect(subject).to_not be_valid
  end
end
