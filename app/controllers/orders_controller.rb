# frozen_string_literal: true

class OrdersController < ApplicationController
  before_action :set_order, only: %i[show update destroy]
  after_action { pagy_headers_merge(@pagy) if @pagy }

  # GET /orders
  def index
    # @orders = Customer.find(params[:customer_id]).orders
    @orders = OrderFilterService.new(
      params[:search_filter], params[:filters],
      params[:sort_filters]).process
    @pagy, @orders = pagy(@orders, items: params[:limit], page_params: params[:page])
    @pagination = pagy_metadata(@pagy)
    render json: {
      pagination: @pagination,
      data: @orders
    }
  end

  # GET /orders/1
  def show
    render json: @order
  end

  # POST /orders
  def create
    @order = Order.new(order_params)

    if @order.save
      render json: @order, status: :created, location: @order
    else
      render json: @order.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /orders/1
  def update
    if @order.update(order_params)
      render json: @order
    else
      render json: @order.errors, status: :unprocessable_entity
    end
  end

  # DELETE /orders/1
  def destroy
    @order.destroy
  end

  private

    # Use callbacks to share common setup or constraints between actions.
    def set_order
      @order = Order.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def order_params
      params.require(:order).permit(:status, :customer_id)
    end

    def filter_params
      params.require(:filters).permit(:customer_id, :product_id, :status)
    end

    def sort_filter_params
      params.require(:sort_filters).permit(:sort_by, :sort_order)
   end
end
