# frozen_string_literal: true

class CreateProducts < ActiveRecord::Migration[7.0]
  def change
    create_table :products do |t|
      t.string :name
      t.references :category, null: false, foreign_key: true
      t.string :image
      t.text :description
      t.float :unit_price

      t.timestamps
    end
  end
end
