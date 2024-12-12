  class Api::V1::ProductsController < Api::BaseController
    swagger_controller :products, "Productos"

    swagger_api :top_purchases_by_category do
      summary "Obtiene los productos mas comprados por categoria"
      notes "Devuelve una lista de los productos mas comprados por cada categoria"
      response :ok, "Listado de productos", :array_of => :product
    end

    def top_purchases_by_category
      render json: ProductByCategoryService.top_purchases_by_category
    end

    swagger_api :top_earnings_by_category do
      summary "Obtiene los productos con mayores ganancias por categoria"
      notes "Devuelve una lista de los productos con mayores ganancias por cada categoria"
      response :ok, "Listado de productos", :array_of => :product
    end

    def top_earnings_by_category
      render json: ProductByCategoryService.top_earnings_by_category
    end
  end
