# frozen_string_literal: true

class OrderFilterService
  attr_accessor :orders, :search_text_filter, :filters, :sort_filters

  def initialize(search_filter, filters, sort_filters)
    @orders = Order
    @filters = filters
    @sort_filters = sort_filters
    @search_text_filter = search_filter
  end

  def process
    filter_orders_by_search_text_filter
    filter_orders_by_custom_filter
    filter_orders_by_sort_filter
    self.orders
  end

  private

    def filter_orders_by_search_text_filter
      if search_text_filter != nil && search_text_filter != ""
        self.orders = self.orders.where(
          "id LIKE ?",
          "#{search_text_filter.downcase}%")
          .or(self.orders.where("customer_id LIKE ?", "#{search_text_filter.downcase}%"))
          .or(self.orders.where("status LIKE ?", "#{search_text_filter.downcase}%"))
      end
    end

    def filter_orders_by_custom_filter
      if filters != nil && filters != []
        filter_by_status
        filter_by_product
      end
    end

    def filter_by_status
      if filters["status"] != nil
        self.orders = self.orders.where(status: filters["status"])
      end
    end

    def filter_by_product
      if filters["product_id"] != nil
        self.orders = self.orders.joins(:order_items).where(
          order_items: {
            product_id: filters["product_id"]
          })
      end
   end

    def filter_orders_by_sort_filter
      if sort_filters != nil && sort_filters != [] && filters["sort_by"] != nil
        self.orders = self.orders.order("#{sort_filters["sort_by"]} #{sort_filters["sort_order"]}")
      end
    end
end
