class OrderMailer < ApplicationMailer
  default from: 'no-reply@jungle.com'

  def order_email(order)
    @order = order
    @url  = 'http://localhost:3000'
    mail(to: @order.email, subject: "Order ID: #{@order.line_items[0].order_id}")
  end
end
