# frozen_string_literal: true

require "rails_helper"

RSpec.describe Order, type: :model do
  subject {
    customer = Customer.new(
      name: Faker::Name.name, phone: Faker::PhoneNumber.cell_phone_in_e164, email: Faker::Internet.email,
      street: Faker::Address.street_name, city: Faker::Address.city, state: Faker::Address.state,
      country_code: 123, profile_pic: Faker::Internet.url)
    customer.save!
    Order.create!(customer_id: customer.id, status: "pending")
  }
  it "is valid with valid attributes" do
    expect(subject).to be_valid
  end

  it "is not valid without a valid customer_id" do
    subject.customer_id = nil
    expect(subject).to_not be_valid
  end

  it "is not valid without a valid status" do
    subject.status = "Invalid Status"
    expect(subject.status).to_not eq "pending"
    expect(subject.status).to_not eq "completed"
  end

end
