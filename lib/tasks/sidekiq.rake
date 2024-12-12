namespace :sidekiq do
  desc "Run daily report worker"
  task generate_daily_report: :environment do
    GenerateDailyReportWorker.perform_async
  end
end
