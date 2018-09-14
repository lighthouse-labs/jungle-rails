class UserMailer < ApplicationMailer
  default from: 'no-reply@jungle.com'
 
  def receipt_email(order)
    @order = order
    @url  = 'http://jungle.com/'
    mail(to: @order.email, subject: 'Thank you for your order')
  end
end
