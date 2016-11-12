class UserMailer < ApplicationMailer
  default from: 'no-reply@jungle.com'

  def email_receipt(order)
    @order = order
    @url  = 'localhost:3000'
    mail(to: @order.email, subject: 'Jungle Confirmation: Order #{@order.id}')
  end
end
