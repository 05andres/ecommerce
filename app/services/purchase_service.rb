# frozen_string_literal: true

class PurchaseService
  class << self
    def index_by_parameter(params)
      validate_params(params)
      purchases = nil
      filters = {
        "created_at >= ?" => params[:start_date],
        "created_at <= ?" => params[:end_date],
        "product_id = ?" => params[:product_id],
        "customer_id = ?" => params[:client_id],
      }
      filters.each do |condition, value|
        purchases = Purchase.where(condition, value) if value.present?
      end
      purchases = purchases.joins(:product).where(products: { creator_id: params[:admin_id] }) if params[:admin_id]
      purchases
    end

    def index_by_granularity(params, granularity)
      purchases = index_by_parameter(params)
      group_by_granularity(purchases, granularity)
    end

    private

    def validate_params(params)
      raise ArgumentError, "Start date must be before end date" if params[:start_date] && params[:end_date] && params[:start_date] > params[:end_date]
    end

    def group_by_granularity(purchases, granularity)
      group_format = case granularity
                     when 'hour' then 'YYYY-MM-DD HH24:00:00'
                     when 'day'  then 'YYYY-MM-DD'
                     when 'week' then 'IYYY-IW'
                     when 'year' then 'YYYY'
                     else raise ArgumentError, "Granularity '#{granularity}' is not supported."
                     end

      purchases.group("TO_CHAR(purchases.created_at, '#{group_format}')").count
    end
  end
end
