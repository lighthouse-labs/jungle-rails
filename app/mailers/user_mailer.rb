class UserMailer < ApplicationMailer
  default from:'no-reply@jungle.com'
  def order_confirmation(order)
    @order = order
    @url = 'http://localhost:3000/orders'
    mail(to: @order.email, subject: "Your order #{@order.id} is confirmed!")
  end
end
