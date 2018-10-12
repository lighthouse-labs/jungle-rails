class OrderMailer < ApplicationMailer
  default from: 'no-reply@jungle.com'
 
  def receipt_email(order)
    @order = order
    mail(to: @order.email, subject: '#{@order.id}')
  end
end