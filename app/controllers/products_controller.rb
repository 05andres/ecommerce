class ProductsController < ApplicationController

  def top_purchases_by_category
    render json: ProductByCategoryService.top_purchases_by_category
  end

  def top_earnings_by_category
    render json: ProductByCategoryService.top_earnings_by_category
  end

end
