class AdminMailer < ActionMailer::Base
  default from: "from@example.com"

  def self.daily_report_email(report_data, admins)
    @report_data = report_data
    mail(
      to: admins.map(&:email),
      subject: "Daily Purchase Report for #{Date.yesterday}"
    )
  end

end
