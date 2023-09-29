# frozen_string_literal: true

require "rails_helper"

RSpec.describe Product, type: :model do
  subject {
    current_category = Category.new(name: Faker::Name.name, parent_category: Faker::Number.within(range: 1..10))
    current_category.save!
    Product.new(
      name: Faker::Name.name, category_id: current_category.id, image: Faker::Internet.url,
      description: Faker::Lorem.sentence, unit_price: Faker::Number.within(range: 0.0..10.0)
    )
  }

  it "is valid with valid attributes" do
    expect(subject).to be_valid
  end

  it "is not valid with invalid name" do
    subject.name = nil
    expect(subject).to_not be_valid
  end

  it "is not valid with invalid category_id" do
    subject.category_id = nil
    expect(subject).to_not be_valid
  end

  it "is not valid with invalid image url" do
    subject.image = nil
    expect(subject).to_not be_valid
  end

  it "is not valid with empty image url" do
    subject.image = ""
    expect(subject.image).to eq ""
    expect(subject).to_not be_valid
  end

  it "is not valid with invalid description" do
    subject.description = ""
    expect(subject.description).to eq ""
    expect(subject).to_not be_valid
  end

  it "is not valid with invalid unit_price" do
    subject.unit_price = nil
    expect(subject).to_not be_valid
  end

  it "is not valid with invalid unit_price" do
    subject.unit_price = 1.0
    expect(subject.unit_price).to be > 0.0
    expect(subject).to_not be_valid
  end
end
