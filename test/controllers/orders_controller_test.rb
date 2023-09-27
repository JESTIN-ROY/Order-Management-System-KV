# frozen_string_literal: true

require "test_helper"

class OrdersControllerTest < ActionDispatch::IntegrationTest
  def setup
    @order = orders(:one)
  end

  def test_should_get_index
    get orders_url, as: :json
    assert_response :success
  end

  def test_should_create_order
    assert_difference("Order.count") do
      post orders_url, params: { order: { status: @order.status } }, as: :json
    end

    assert_response :created
  end

  def test_should_show_order
    get order_url(@order), as: :json
    assert_response :success
  end

  def test_should_update_order
    patch order_url(@order), params: { order: { status: @order.status } }, as: :json
    assert_response :success
  end

  def test_should_destroy_order
    assert_difference("Order.count", -1) do
      delete order_url(@order), as: :json
    end

    assert_response :no_content
  end
end
