# frozen_string_literal: true

class Category < ApplicationRecord
  has_many :products, dependent: :destroy

  validates :name, presence: true
  validates :parent_category, presence: true
end
