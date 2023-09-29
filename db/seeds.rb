# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
puts "Seeding ..."
100.times do
  Customer.create!(
    name: Faker::Name.name, phone: Faker::PhoneNumber.cell_phone_in_e164, email: Faker::Internet.email,
    street: Faker::Address.street_name, city: Faker::Address.city, state: Faker::Address.state,
    profile_pic: Faker::Internet.url)
end

Customer.all.each do |customer|
  Order.create!(customer_id: customer.id, status: "pending")
end

10.times do
  Category.create!(
    name: Faker::Name.name,
    parent_category: Faker::Number.within(range: 1..10)
  )
end

Category.all.each do |category|
  Product.create!(
    name: Faker::Name.name, category_id: category.id, image: Faker::Internet.url,
    description: Faker::Lorem.sentence, unit_price: Faker::Number.within(range: 0.0..10.0))
end

Order.all.each do |each_order|
  OrderItem.create!(
    order_id: each_order.id,
    product_id: Faker::Number.within(range: 1..10),
    quantity: Faker::Number.digit)
end

puts "Seeding done."
