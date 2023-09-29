# frozen_string_literal: true

class Customer < ApplicationRecord
  has_many :orders, dependent: :destroy

  validates :name, presence: true
  validates :phone, presence: true
  validates :email, presence: true
end
