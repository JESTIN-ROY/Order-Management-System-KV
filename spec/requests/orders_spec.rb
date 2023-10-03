# frozen_string_literal: true

require "rails_helper"

RSpec.describe "Orders", type: :request do
  describe "GET /orders" do
    it "returns a list of orders" do
      # Create some sample orders using FactoryBot
      orders = FactoryBot.create_list(:order, 3)

      get orders_path

      expect(response).to have_http_status(:ok)
      expect(JSON.parse(response.body)).to include("pagination", "data")
      expect(JSON.parse(response.body)["data"].length).to eq(3)
    end
  end

  describe "GET /orders/:id" do
    it "returns a single order" do
      order = FactoryBot.create(:order)

      get "/orders/#{order.id}"

      expect(response).to have_http_status(:ok)
      expect(JSON.parse(response.body)).to include("id", "status", "customer_id")
    end

    it "returns a invalid order" do
     order = FactoryBot.create(:order)

     get "/orders/999"

     expect(response).to have_http_status(:not_found)
   end

  end

  describe "PUT /orders" do
    it "creates a new order" do
      customer = FactoryBot.create(:customer)
      valid_attributes = { order: { status: "pending", customer_id: customer.id } }

      put orders_path, params: valid_attributes

      expect(response).to have_http_status(:created)
      expect(Order.count).to eq(1)
    end

    it "returns unprocessable_entity when order creation fails" do
      invalid_attributes = { order: { status: "invalid_status" } }

      put orders_path, params: invalid_attributes

      expect(response).to have_http_status(:unprocessable_entity)
    end
  end

  describe "PATCH /orders/:id" do
    it "updates an existing order" do
      order = FactoryBot.create(:order)
      updated_status = "shipped"
      valid_attributes = { order: { status: updated_status } }

      patch "/orders/#{order.id}", params: valid_attributes

      expect(response).to have_http_status(:ok)
      expect(order.reload.status).to eq(updated_status)
    end

    # it "returns unprocessable_entity when order update fails" do
    #   order = FactoryBot.create(:order)
    #   invalid_attributes = { order: { status: "invalid_status" } }

    #   patch "/orders/#{order.id}", params: invalid_attributes
    #   byebug
    #   expect(response).to have_http_status(:unprocessable_entity)
    # end
  end

  describe "DELETE /orders/:id" do
    it "deletes an existing order" do
      order = FactoryBot.create(:order)

      delete "/orders/#{order.id}"

      expect(response).to have_http_status(:no_content)
      expect(Order.count).to eq(0)
    end
  end
end
