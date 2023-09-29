# frozen_string_literal: true

class MakeNumericColumnsNotNullable < ActiveRecord::Migration[7.0]
  def change
    change_column_null :order_items, :quantity, false

    change_column_null :products, :unit_price, false
  end
end
