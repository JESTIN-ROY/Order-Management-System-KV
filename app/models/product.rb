# frozen_string_literal: true

class Product < ApplicationRecord
  belongs_to :category
  has_many :order_items, dependent: :destroy
  has_many :orders, through: :order_items

  validates :name, presence: true
  validates :image, presence: true
  validates :description, presence: true
  validates :unit_price, presence: true
end
