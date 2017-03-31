class UserMailer < ApplicationMailer
  default from: "no-reply@jungle.com"
  layout 'mailer'

  def receipt_email(order)
    @order = order
    mail(to: @order.email, subject: 'Thank you for your order! Order# #{@order.id}')

  end
end