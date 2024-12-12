class Api::V1::PurchasesController < Api::BaseController

  def index_by_parameter
    render json: PurchaseService.index_by_parameter(params)
  end

  def index_by_granularity
    render json: PurchaseService.index_by_granularity(params, params[:granularity])
  end
end
