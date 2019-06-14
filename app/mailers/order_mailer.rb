class OrderMailer < ApplicationMailer
    default from: 'notifications@example.com'
 
  def order_email(order)
    @order = order
    @url  = 'localhost:3000/'
    mail(to: @order.email, subject: 'Welcome to My Awesome Site')
  end
end
