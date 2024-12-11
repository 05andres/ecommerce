class Purchase < ActiveRecord::Base
  belongs_to :product
  belongs_to :customer
  attr_accessible :product, :customer, :quantity, :total_amount

  after_create :check_first_purchase, if: :check_first_purchase

  private

  def check_first_purchase
    product.purchases.count == 1
  end

  def send_email_first_purchase
    creator = product.creator
    PurchaseMailer.first_purchase_email(
      product,
      creator,
      Admin.where.not(id: creator.id)
    ).deliver
  end
end
