class PurchaseMailer < ActionMailer::Base
  default from: "from@example.com"

  def first_purchase_email(product, creator, admins)
    @product = product
    mail(
      to: creator.email,
      cc: admins.map(&:email),
      subject: "First Purchase of '#{product.name}'"
    )
  end
end
