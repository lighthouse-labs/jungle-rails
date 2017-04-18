class UserMailer < ApplicationMailer
  default from: 'no-reply@jungle.com'

  def email_receipt(order)
    @order = order
    mail(to: @order.email, subject: "Order receipt for order #{@order.id}")
  end
end
