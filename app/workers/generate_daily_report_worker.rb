class GenerateDailyReportWorker
  include Sidekiq::Worker

  def perform
    yesterday = Date.yesterday
    purchases = Purchase.where("created_at >= ? AND created_at <= ?", yesterday.beginning_of_day, yesterday.end_of_day)

    report_data = purchases.group_by(&:product).map do |product, purchases|
      {
        product_name: product.name,
        total_quantity: purchases.sum(&:quantity),
        total_earns: purchases.sum(&:total_price)
      }
    end

    AdminMailer.daily_report_email(report_data, Admin.all).deliver
  end
end
