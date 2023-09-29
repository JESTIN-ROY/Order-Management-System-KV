# frozen_string_literal: true

require "rails_helper"

RSpec.describe Category, type: :model do
  subject {
    Category.new(name: Faker::Name.name, parent_category: Faker::Number.within(range: 1..10))
  }

  it "is valid with valid attributes" do
    expect(subject).to be_valid
  end

  it "is not valid without a valid name" do
    subject.name = nil
    expect(subject).to_not be_valid
  end

  it "is not valid without a valid parent_category" do
    subject.parent_category = nil
    expect(subject).to_not be_valid
  end

end
