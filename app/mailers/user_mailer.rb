class UserMailer < ApplicationMailer
  default from: 'no-reply@jungle.com'

  def order_email(order)
    @order = order
    @url  = 'localhost:3000/orders/:id'
    mail(to: @order.email, subject: 'Order ID: #{@order.id}')
  end
end
