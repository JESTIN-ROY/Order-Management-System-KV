# frozen_string_literal: true

require "rails_helper"

RSpec.describe OrderItem, type: :model do
  subject {
    current_category = Category.new(name: Faker::Name.name, parent_category: Faker::Number.within(range: 1..10))
    current_category.save!
    current_product = Product.new(
      name: Faker::Name.name, category_id: current_category.id, image: Faker::Internet.url,
      description: Faker::Lorem.sentence, unit_price: Faker::Number.within(range: 0.0..10.0)
    )
    current_product.save!
    current_customer = Customer.new(
      name: Faker::Name.name, phone: Faker::PhoneNumber.cell_phone_in_e164, email: Faker::Internet.email,
      street: Faker::Address.street_name, city: Faker::Address.city, state: Faker::Address.state,
      country_code: 123, profile_pic: Faker::Internet.url)
    current_customer.save!
    current_order = Order.new(customer_id: current_customer.id, status: "pending")
    current_order.save!
    OrderItem.create!(
      order_id: current_order.id,
      product_id: current_product.id,
      quantity: Faker::Number.digit
    )
  }

  it "is valid with valid attributes" do
    expect(subject).to be_valid
  end

  it "is not valid without a valid order_id" do
    subject.order_id = nil
    expect(subject).to_not be_valid
  end

  it "is not valid without a valid product_id" do
    subject.product_id = nil
    expect(subject).to_not be_valid
  end

  it "is not valid without a valid quantity" do
    subject.quantity = nil
    byebug
    expect(subject).to_not be_valid
  end

end
