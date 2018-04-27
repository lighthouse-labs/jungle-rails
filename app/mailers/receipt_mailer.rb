class ReceiptMailer < ApplicationMailer
  default from: "no-reply@jungle.com"

  def receipt_mailer(order)
    @order = order
    mail(to: @order.email, subject: "Order: #{@order.id}")
  end
end
