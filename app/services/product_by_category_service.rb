# frozen_string_literal: true

class ProductByCategoryService
  def self.top_purchases_by_category(limit = 4)
    Category.includes(:products).map do |category|
      top_products = category.products
                             .joins(:purchases)
                             .select("products.*, SUM(purchases.quantity) AS total_quantity")
                             .group("products.id")
                             .order("total_quantity DESC")
                             .limit(limit)

      { category: category.name, top_products: top_products }
    end
  end

  def self.top_earnings_by_category(limit = 3)
    Category.includes(:products).map do |category|
      top_products = category.products
                              .joins(:purchases)
                              .select("products.id, products.name, SUM(purchases.total_amount) AS total_earns")
                              .group("products.id")
                              .order("total_earns DESC")
                              .limit(limit)

      { category: category.name, top_products: top_products }
    end
  end
end
