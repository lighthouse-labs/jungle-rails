class OrderReceiptMailer < ApplicationMailer
  default from: 'no-reply@jungle.com'

  def confirm_order(order)
    @order = order
    mail(to: @order.email, subject: "Order confirmation ##{@order.id}")
  end
end
