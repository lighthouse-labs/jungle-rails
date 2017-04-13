class UserMailer < ApplicationMailer
  default from: 'no-reply@jungle.com'

  def email_receipt(order)
    @order = order
    mail(to: @order.email, subject: 'Order Receipt')
  end
end
