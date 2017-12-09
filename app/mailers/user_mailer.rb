class UserMailer < ApplicationMailer
  default from: 'no-reply@jungle.com'

  def order_placed_email(order)
    @order = order
    @url = 'http://localhost:3000/'
    mail(to: @order.email, subject: 'Your order ID : #{@order.id} %>')
  end
end
